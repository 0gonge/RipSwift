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
            self.view.addSubview(blueView)
        //Subview우리가 그려줄 빨간색 사전에 정의된 뷰를 컨트롤러의 뷰에 추가
            print("frame: \(self.blueView.frame) \nbounds: \(self.blueView.bounds)")
        //frame과 bounds를 이해하기 위해 좌표를 프린트 해주었다.
        //frame은 부모 뷰에서 뷰의 위치와 크기를 나타내고.
        //bounds는 뷰 자체의 (자기 자신) 에서 자신의 위치와 크기를 나타낸다 자기가 기준이니까0,0이다.
        }
        
        private var blueView: UIView = {
            //redView는 UIView의 private 변수다. 클래스 외부에서 접근 불가하고, 뷰 컨 내에서만 사용된다.
            var view = UIView(frame: .init(origin: .init(x: 100, y: 100),
                                           size: .init(width: 100, height: 100)))
            //초기 생성자 생성을 해 주고, 초기화를 해주었다.
            view.backgroundColor = .blue
            //이 subview의 색을 red로 해주었다.
            return view
            // 객체 설정이 완료 된 view를 반환해서 redview에 리턴해줌.
            //이름은 그냥 내가 subview를 어떻게 선언을 해주냐에 따라 달라지는거구나. UIView내에 정의되어있는 줄 알았음;; ㅋㅋ
        }()
}
