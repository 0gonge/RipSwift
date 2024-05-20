//
//  ViewController.swift
//  InDetail
//
//  Created by 송여경 on 4/25/24.
//

import UIKit
// ViewController는 뷰의 계층을 관리하고, 해당 뷰들의 인터페이스, 레이아웃을 관리한다!
//(당연히 모든 뷰컨은 한개의 루트뷰를 가지게 된다.)
// 데이터를 뷰에 업데이트 / 자신이 관리하는 View와 내부의 데이터를 중계.
// 사용자의 모든 이벤트는 ViewController가 받는다.
// 앱 내에 다른 뷰 컨트롤러를 포함해서 다른 객체와도 협력한다. 너 정말 만능꾼이구나?
// 뷰의 생명 주기를 관리한다.
// loadView가 뷰를 만들고, 메모리에 올린 후에 viewDidLoad가 호출됩니다.
class ViewController: UIViewController {
    //뷰 컨트롤러인거까지는 오케이~
    override func viewDidLoad() {
        // 라이프 사이클에서 배웠듯이, 뷰 컨트롤러의 뷰가 메모리에 로드 된 후에 호출되는 메서드다! 초기 설정 수행해야 한다.
        
            super.viewDidLoad()
        //이 부분은 써도 되고 안써도 되는데, 안정정을 위해서 호출을 해주는게 좋은 습관이라고 한다.
        //viewDidLoad()가 일종의 초기화라고 가정하면 수퍼클래스에서 올바르게 설정하기 위해 먼저 super.viewDidLoad()를 호출해야 한다.
        //상위 클래스에서 정의된 viewDidLoad를 호출해주어 로드 완료후의 처리를 수행하는 것이다.
            self.view.backgroundColor = .white
        //뷰 컨트롤러의 뷰 배경색을 흰색으로-
//            self.view.addSubview(blueView)
//        //Subview우리가 그려줄 빨간색 사전에 정의된 뷰를 컨트롤러의 뷰에 추가
//            print("frame: \(self.blueView.frame) \nbounds: \(self.blueView.bounds)")
        //frame과 bounds를 이해하기 위해 좌표를 프린트 해주었다.
        //frame은 부모 뷰에서 뷰의 위치와 크기를 나타내고.
        //bounds는 뷰 자체의 (자기 자신) 에서 자신의 위치와 크기를 나타낸다 자기가 기준이니까0,0이다.
        setLayout()
        }
        
//        private var blueView: UIView = {
//            //redView는 UIView의 private 변수다. 클래스 외부에서 접근 불가하고, 뷰 컨 내에서만 사용된다.
//            var view = UIView(frame: .init(origin: .init(x: 100, y: 100),
//                                           size: .init(width: 100, height: 100)))
//            //초기 생성자 생성을 해 주고, 초기화를 해주었다.
//            view.backgroundColor = .blue
//            //이 subview의 색을 red로 해주었다.
//            return view
//            // 객체 설정이 완료 된 view를 반환해서 redview에 리턴해줌.
//            //이름은 그냥 내가 subview를 어떻게 선언을 해주냐에 따라 달라지는거구나. UIView내에 정의되어있는 줄 알았음;; ㅋㅋ
//        }()
    private let scrollView = UIScrollView()
        private var contentView = UIView()
        
        private let redView: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()
    //UIView상속 받아주고, view변수에서 사용해주고, backgroundColor를 red로 지정을 해주었다.
    //아래도 같은 방법으로 연장해준다.
        
        private let orangeView: UIView = {
            let view = UIView()
            view.backgroundColor = .orange
            return view
        }()
        
        private let yellowView: UIView = {
            let view = UIView()
            view.backgroundColor = .yellow
            return view
        }()
        
        private let greenView: UIView = {
            let view = UIView()
            view.backgroundColor = .green
            return view
        }()
        
        private let blueView: UIView = {
            let view = UIView()
            view.backgroundColor = .blue
            return view
        }()
        
        private let purpleView: UIView = {
            let view = UIView()
            view.backgroundColor = .purple
            return view
        }()
    //여기까지 구성요소들을 선언을 해주었다.
        //이제 레이아웃을 잡아줄 차례.
    private func setLayout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        // scrollView에 subview로 contentView를 넣어주었다.
        //레이아웃을 잡아준다.
        [redView, orangeView, yellowView, greenView, blueView, purpleView].forEach {
            contentView.addSubview($0)
        }
        //forEach로 각각의 요소들을 뷰에 넣어주고 있다.
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        //scrollView의 모든 가장자리가 부모 뷰의 가장자리에 맞도록 제약을 설정하는 것. 이 제약덕분에 scrollView는 부모 뷰의 전체 영역을 채우게 되는 것이다.
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(3 * 337)
            //view안에서 스크롤 가능한 영역을 만들어준 것이다.
            //만약 이 코드 없다면?
            //서브뷰들의 높이 합계가 scrollView의 높이보다 작다면 스크롤이 불가능해질 수 있다.
            make.height.greaterThanOrEqualTo(scrollView).priority(.low)
            //make.height.equalTo(3 * 337)로 contentView의 고정된 높이를 설정하고, make.height.greaterThanOrEqualTo(scrollView).priority(.low)로 높이 제약을 더 유동성있게 처리를 해준다고 보면 되겠다.
        }
        //// 6 뷰의 높이를 합산하여 contentView의 높이를 설정
        //width를 지정해줌으로써 contentView의 크기가 scrolView의 범위를 벗어나지 않게 해준다.
        //이 덕분에 가로 스크롤 발생 X
        //contentView의 높이가 scrollView의 높이보다 크거나 같도록 제약을 설정해주었다.-> 스크롤이 가능하게
        //이는 contentView의 높이가 scrollView의 높이보다 작을 경우 scrollView의 높이와 같아지지만, contentView의 높이가 더 클 경우 scrollView 내에서 스크롤이 가능하도록 크게.
        redView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            //top은 contentView에 맞추어주고,
            make.leading.equalToSuperview()
            //왼쪽은 superview와 맞추어주었다.
            make.trailing.equalToSuperview().offset(-188)
            //오른쪽은 -188만큼을 주었고
            make.height.equalTo(337)
            //높이를 설정해주었다.
        }
        
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(redView.snp.trailing)
            //make.leading은 orangeView의 왼쪽 가장자리(leading edge)를 가리킴
            //equalTo(redView.snp.trailing)는 redView의 오른쪽 가장자리(trailing edge)와 같도록 orangeView의 왼쪽 가장자리를 맞춘다는 뜻!!!
            make.trailing.equalToSuperview()
            //오른쪽은 superview에 맞추어준다.
            make.height.equalTo(337)
        }
        
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            //redView아래에 top을 맞춘다.
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-188)
            make.height.equalTo(337)
        }
        //아래는 같은 느낌으로 반복해주면된다.
        greenView.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.leading.equalTo(yellowView.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(337)
        }
        
        blueView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview().offset(-188)
            make.height.equalTo(337)
        }
        
        purpleView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom)
            make.leading.equalTo(blueView.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(337)
        }
    }
    //contentView가 scrollView와 동일한 너비를 가지며, 높이는 scrollView보다 크거나 같도록 설정
    //높이 제약의 우선순위를 낮게 설정하여, 다른 제약 조건이 우선되도록
    //이를 통해 scrollView는 수직으로 스크롤 가능한 콘텐츠 영역이 된다.
    }


