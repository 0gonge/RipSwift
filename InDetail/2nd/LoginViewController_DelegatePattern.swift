//
//  LoginViewController_DelegatePattern.swift
//  InDetail
//
//  Created by 송여경 on 5/3/24.
//

import UIKit

final class LoginViewController_DelegatePattern: UIViewController {
//    func dataBind(id: String?) {
//        <#code#>
//    }
    //이 부분은 이 프로토콜을 채택하는 모든 클래스는 이 메서드를 구현해야한다.
    //따르기로 했으면 규약을 지켜야지..? 하는 개념으로 이해하자.
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    //구조가 잘 안잡혀서 전체적인 구조를 잡아보겠다.
    //로그인 뷰컨에 뷰컨이니까 UIViewController, 그리고 요소들을 정의해준다. 타이틀은 라벨이고, 위치까지 지정해 준 모습이다.
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    //로그인 뷰 컨에 필요한 요소, 그 중에서도 idTextField를 정의해주고 있다. 텍스트 필드 -> 입력 전에 보여줄 텍스트.
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    //비밀번호 텍스트 필드를 구현해준 모습이다.
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    //필수적인 로그인 버튼을 구현해주었다. 저번에 분석했던거 더듬으면서 정리하자.
    //위치까지!
    
    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController_DelegatePattern()
        welcomeViewController.delegate = self
        //WelcomeVC에서 할 일 여기 LoginVC에서 대신 할게라고 말해주는 부분.
        //착하네 그러고보니.. 내가 할게라고 하는게 귀엽다
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    //구조를 다 잡아주었으면, 이제 어떻게 보면 기능 부분인데, 로그인 버튼을 누르면 웰컴뷰컨을 push하기 위한 코드이다. 웰컴 뷰 컨에는 로그인 뷰컨에서 데이터를 받은 부분을 띄워주어야 하기 때문에 그 부분을 여기에서 대신 해 준다.
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    //로그인 버튼이 눌리면, 웰컴뷰컨 push해주는 모습.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    //이 부분이 있어야 뷰컨에 여태 구현해준 요소들이 올라오게 된다. viewDidLoad.
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
    //위에서 정의해준 요소들을 setLayout함수에 묶어주고, subview로 forEach 각각 넣어주었다.
    
}

extension LoginViewController_DelegatePattern:
    DataBindProtocol {
    func dataBind(id: String?) {
        guard let idText = id else {return}
        self.idTextField.text = "\(idText)에서 어떤걸로 할꺼얌?"
    }
}
//welcome뷰컨에서 위임한 일을 구체화 해주는 것이다.
//guard let -> true일 경우에만 진행하고 아닐 경우 뒷 부분을 아예 실행을 해 주지 않는다.
//조금 더 가독성 있게 작성해주었다.
//다음으로는 delegate = self 선언을 해주어야 한다.
//진짜 위임받을게라는 의미를 가진 내용이 필요하다.
//dataBind 아이디를 옵셔널로 받아 주었고 이를 guard let으로 optional값을 언래핑해주었다. 


