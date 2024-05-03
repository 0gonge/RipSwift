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
//프로토콜 : like guideline
//프로토콜을 채택하는 타입이 클래스인지 구조체인지 열거형인지 알 수 없다.
//그래서 프로토콜은 상속받아서 class에만 사용할 것이라고 알려줘야 한다.
//AnyObject를 상속한 프로토콜은 클래스만 채택할 수 있어서 AnyObject를 채택.


final class WelcomeViewController_DelegatePattern: UIViewController {
    
    weak var delegate: DataBindProtocol?
    
    private var id: String?
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 112, y: 87, width: 150, height: 150))
        imageView.image = UIImage(named: "dog")
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
        if let id = id {
            delegate?.dataBind(id: id)
        }
        self.navigationController?.popViewController(animated: true)
    }
    //if let id = id 를 통해 id 값이 nil인지 아닌지를 확인
    //id가 nil이 아닌 경우 델리게이트 실행. dataBind(id:id)는 위임받은 객체가 DataBind프로토콜을 채택하고 있다는 의미이다.
    //nil일 경우 현재의 뷰컨을 navigationcontroller에서 제거하고 이전으로 돌아감. 
    //옵셔널 바인딩 진행
    //위임할 delegate 변수를 선언하고, 백 버튼을 눌렀을 때, 일을 시키는 delegate?.dataBind(id: id)를 호출해서 할일을 지시한다.
    //그러면 데이터 바인딩 역할은 어디에서?
    //로그인뷰컨에서!
    
}

