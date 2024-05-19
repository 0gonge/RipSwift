//
//  WelcomeViewController_Closure.swift
//  InDetail
//
//  Created by 송여경 on 5/3/24.
//

import UIKit

final class WelcomeViewController_Closure: UIViewController {
    
    private var id: String?
    
    typealias handler = ((String) -> (Void))
    var completionHandler: handler?
    //typealias : 기존 타입에 새로운 별칭을 주는 것이다.
    //Void를 클로저로 반환해주고 있는데 이는 아무것도 반환해주지 않는 것이다.
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "logo2")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 295, width: 95, height: 60))
        label.text = "???님 \n반가워요!"
        label.font = UIFont(name: "Pretendard-ExtraBold", size: 25)
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    private var goHomeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
        button.setTitle("메인으로", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        return button
    }()
    
    private lazy var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private func bindID() {
        guard let idText = id else { return }
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    
    func setLabelText(id: String?) {
        self.id = id
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        
        bindID()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            self.view.addSubview($0)
        }
    }
    
    @objc
    private func backToLoginButtonDidTap() {
        guard let id else { return }
        completionHandler?(id)
        self.navigationController?.popViewController(animated: true)
    }
    //back버튼 눌러서 뒤로 갈 때, 클로저의 input에 id라는 String 데이터를 담아준다. B->A로 전달하는 것이다. 웰컴뷰에서 로그인뷰로 돌아가는 것!
    //pop 해준다.
    //objc : 버튼의 addTarget이 오브젝트 C 기반이다.
    //guard let부분은 id 변수가 nil이 아닌지 확인한다. id가 nil이면 return하고 종료, nil이 아니면 id 값 사용. id가 nil일 경우, 이후 코드가 실행이 안된다.
    //completionHandler?: 옵셔널 체이닝!! completionHandler가 nil이 아닌 경우에만 클로저를 호출
    //여기서 받은 id는 위에서 정의해준 string -> void 클로저로 가져다 준다. (여기에서는 Void를 반환하니까 아무일도 X)
    //네비게이션 스택에서 현재 뷰 컨을 팝~ 없애줌. 
}

