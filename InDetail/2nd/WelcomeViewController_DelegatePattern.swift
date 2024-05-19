//
//  WelcomeViewController_DelegatePattern.swift
//  InDetail
//
//  Created by 송여경 on 5/3/24.
//

import UIKit

protocol DataBindProtocol: AnyObject {
    func dataBind(id: String?)
}
//dataBind는 loginViewController에서 extention으로 구현을 해주었음. 그것을 쓰겠다는 의미.
//프로토콜의 위치는 보통은 위에 위치하는구나를 알았다.
//프로토콜 : like guideline
//프로토콜을 채택하는 타입이 클래스인지 구조체인지 열거형인지 알 수 없다.
//그래서 프로토콜은 상속받아서 class에만 사용할 것이라고 알려줘야 한다.
//AnyObject를 상속한 프로토콜은 클래스만 채택할 수 있어서 AnyObject를 채택.


final class WelcomeViewController_DelegatePattern: UIViewController {
    
    weak var delegate: DataBindProtocol?
    //DataBindProtocol을 따르는 다른 객체에 delegate하고자 함.
    //weak는 약한 참조로, 메모리의 순환 참조를 피할 수 있다. 순환참조란, 두 객체가 서로를 강하게 참조해서 서로 해제가 되지 않는 상황을 말한다.
    //메모리를 효율적으로 사용하기 위해서다.
    //?로 옵셔널로 선언해 준 이유는, delegate가 항상 필요한 것은 아니고, 델리게이트가 설정이 되지 않았을 경우에도 잘 동작하게 하기 위함이다.
    //궁극적으로 델리게이트가 필요 없을 때 쓸데 없는 메모리 누수를 방지할 수 있다.
    
    private var id: String?
    //id 변수 선언해주고
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dog")
        return imageView
    }()
    //로그인 뷰컨과 마찬가지로 필요한 요소들의 특징과 위치를 잡아준다.
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    //여기도, 얘들만 써주면 일단 화면에 표시되지는 않는 다는 사실을 다시 상기하자.
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    // 버튼까지 구현 근데 왜 얘는 lazy var가 아니지?
    //메인으로에 딱히 할 일이 없어서 인 것 같기는 한데 일반적으로 리소스가 많이 필요하지 않거나, 복잡한 초기화가 필요하지 않을 때는 lazy를 해주지 않아도 된다고 한다.
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    //다시 로그인 버튼의 전반적인 layout을 잡아주었음.
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    //idtext에 id가 있을 경우에만 뒷 내용이 실행이 된다. 그리고 optional을 언래핑해준다. -> guard let
    
    func setLabelText(id: String?) {
        self.id = id
    }
    //이 코드가 하는일이 뭘까에 대해 굉장히 많이 고민했음.
    //id값을 bindID에서 띄워주기 위해서 해주는 것이다.
    //만약 이 코드가 없었다면, 외부에서 id 값을 WelcomeViewController_DelegatePattern에 설정할 방법이 없어진다.
    //이거 없으면 기본으로 설정을 해 둔 ???님 반가워요로 뜰 것임.
    //self.id는 이 웰컴뷰컨 위쪽에 변수로 선언해둔 id를 뜻한다.
    //이때 옵셔널로 선언이 되어있어서, string일 수도, nil일 수도 있다.
    // = id 이거는 외부에서 받아오는 값이다.
    //로그인 뷰컨의 pushToWelcomeVC내에서 쓰이고 있다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        bindID() //도 여기에 넣어주어야 한다.이걸 통해 받은 id값이 라벨에 반영이 된다.
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    //요소들 레이아웃 구성요소에 subview로 추가.

    @objc
    private func backToLoginButtonDidTap() {
        if let id = id {
            delegate?.dataBind(id: id)
        }
        self.navigationController?.popViewController(animated: true)
    }
    //if let id = id 를 통해 id 값이 nil인지 아닌지를 확인
    //id가 nil이 아닌 경우, 델리게이트 실행. dataBind(id:id)는 위임받은 객체가 DataBind프로토콜을 채택하고 있다는 의미이다.
    //nil일 경우 현재의 뷰컨을 navigationcontroller에서 제거하고 이전으로 돌아감.!!!
    //옵셔널 바인딩 진행
    //위임할 delegate 변수를 선언하고, 백 버튼을 눌렀을 때, 일을 시키는 delegate?.dataBind(id: id)를 호출해서 할일을 지시한다.
    //그러면 데이터 바인딩 역할은 어디에서?
    //로그인뷰컨에서!
    
}

