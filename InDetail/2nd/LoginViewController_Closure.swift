//
//  LoginViewController_Closure.swift
//  InDetail
//
//  Created by 송여경 on 5/3/24.
//

import UIKit

final class LoginViewController_Closure: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 69, y: 161, width: 236, height: 44))
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 21, y: 422, width: 332, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private func pushToWelcomeVC() {
        //전체적으로 WelcomeView로 넘어가게 해주는 함수다.
        let welcomeViewController = WelcomeViewController_Closure()
        //새로운 인스턴스 생성
        welcomeViewController.completionHandler = { [weak self] id in
            guard let self else { return }
            self.idTextField.text = "\(id)에서 어떤걸로 할꺼얌?"
        }
        //이 completionHandler클로저는 웰컴뷰컨에서 backtologinbuttondidtap이 될 경우에만 실행이 된다.
        //클로저 안의 completionHandler에 대해서 정의를 해주고 있다.
        //[weak self] 강한 순환 참조를 방지해주고 있다.
        //self가 nil이면 종료 되고 nil이 아닐 경우에만 실행을 시켜주는 guard let.
        //id 값을 idTextField에 id에서 어떤 걸로 할거얌? 이라고 업데이트를 해준다.
        welcomeViewController.setLabelText(id: idTextField.text)
        //업데이트를 해준다. setLabelText메서드 호출해서,idTextField에 입력된 텍스트를 id로 설정해주고 있다.
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
        //welcomeViewController?는 현재 뷰가 네비게이션 컨트롤러에 있을 경우에만 해주기 위해.
        //welcomeViewController를 push해서 띄워주고 있다.
    }
    
    @objc
    private func loginButtonDidTap() {
        pushToWelcomeVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
    }
}
