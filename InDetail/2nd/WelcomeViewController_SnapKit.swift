//
//  WelcomeViewController_SnapKit.swift
//  InDetail
//
//  Created by 송여경 on 5/20/24.
//

import UIKit
import SnapKit

final class WelcomeViewController_SnapKit: UIViewController {
    
    private var id: String?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            //레이아웃과의 충돌 위험을 없애주기 위해 써준다. 코드베이스일 경우에만 false로 해줌.
        }
        
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(87)
            //87로 offset잡아주고, 이미지의 넓이와 높이를 정해주었다.
            make.width.height.equalTo(150)
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(58)
            //로그인 이미지의 bottom으로부터 58만큼 아래.
        }
        
        goHomeButton.snp.makeConstraints { make in
                    make.left.right.equalToSuperview().inset(20)
                    make.top.equalTo(welcomeLabel.snp.bottom).offset(61)
                    make.height.equalTo(58)
        }
        
//        goHomeButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(welcomeLabel.snp.bottom).offset(61)
//            //welcome라벨의 bottom으로부터 offset 61
//            make.height.equalTo(58)
//            make.width.equalTo(335)
            
            //make.centerX.equalToSuperview()는 버튼을 화면의 중앙에 정렬한다. 이 방식은 고정된 너비와 결합되면, 화면 크기가 변경될 때 버튼의 위치와 모양이 어색해질 수 있다.
            //나는 왜 센터에 정렬해서 넓이, 높이만 맞춰주면 되는데 안그럴까 궁금해서 실행해봤는데 아래 다시 로그인 하기 버튼과 약간 다르다는 점을 알게 되었고 이유를 찾았다.
        
        backToLoginButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(20)
            //left.right를 20만큼 inset
            make.top.equalTo(goHomeButton.snp.bottom).offset(14)
            //메인으로 버튼보다 14만큼 아래
            make.height.equalTo(58)
            //높이를 지정해준다. 넓이는 양쪽을 맞추어주었으므로 필요X
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {}
}
