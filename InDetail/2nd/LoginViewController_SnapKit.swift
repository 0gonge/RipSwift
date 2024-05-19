//
//  LoginViewController_SnapKit.swift
//  InDetail
//
//  Created by 송여경 on 5/20/24.
//

import UIKit
import SnapKit

final class LoginViewController_SnapKit: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "Pretendard-Bold", size: 18)
        return label
    }()
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
//        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [titleLabel, idTextField, passwordTextField, loginButton].forEach {
            self.view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(161)
            make.width.equalTo(236)
            make.height.equalTo(44)
        }
        //피그마를 보면서 하면, 위치는 centerX로 잡아주고, width, height만 잡아주면 오케이다.
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(71)
            //titleLabel의 bottom을 기준으로 offset71 아래 방향이니까 +
            make.left.right.equalToSuperview().inset(20)
            //양쪽 모두가 superview의 inset으로 20만큼!
            make.height.equalTo(52)
            //높이는 따로 잡아주기.
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(7)
            //idTextField의 bottom을 기준으로 offset7만큼.
            make.left.right.equalTo(idTextField)
            //idTextField와 같이 좌 우를 잡아줌. -> 이렇게 쓸 수도 있구나?
            make.height.equalTo(52)
            //높이도 잡아줌. 이건왜 따로 해주지
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            //로그인 버튼도 마찬가지로 passwordTextField의 bottom을 기준으로 offset 35를 준다.
            make.left.right.equalTo(idTextField)
            //위와 같고,
            make.height.equalTo(58)
            //높이를 잡아주었다. 
        }
    }
}
