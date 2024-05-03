//
//  LoginViewController.swift
//  InDetail
//
//  Created by 송여경 on 4/26/24.
//

import UIKit
//UIViewController, UILable 모두 UIKit이라는 프레임워크에 속한 클래스다.
//final은 상속되지 않음을 의미한다.
final class LoginViewController: UIViewController{
    private let titleLabel: UILabel = {
        //private로 선언이 되어서 이 클래스 내부에서만 접근이 가능하다.
        let logo = UILabel(frame: CGRect(x:70, y:161, width: 236, height: 44))
        logo.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        logo.textColor = .black
        logo.textAlignment = .center
        logo.numberOfLines = 2
        logo.font = UIFont(name: "Pretendard-Bold", size: 18)
        return logo
    }()
    //여기 클래스 내부에서는 다른 클래스의 변수 이름과 겹쳐도 오류가 나지 않음을 확인했다..
    //클로저를 통해 초기화를 해주고 있는데 return logo 클로저가 바로 실행되어 저장되는 모습이다.
    //모든 설정을 한 곳에 명확하게 집중하게 되어 관리가 용이해진다.
    
    private let idTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 21, y: 276, width: 335, height: 52))
        textField.placeholder = "아이디"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 21, y: 335, width: 335, height: 52))
        textField.placeholder = "비밀번호"
        textField.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        textField.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        return textField
    }()
    private lazy var loginButton: UIButton = {
        //lazy? 이 변수의 초기화가 실제로 필요할 때 그러니까 버튼을 누를 때 까지 연기된다는 것이다. -> 효율적으로 메모리 사용 가능하다.
        //앱 시작 시간도 단축시켜준다.
            let button = UIButton(frame: CGRect(x: 20, y: 422, width: 332, height: 58))
            button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
            button.setTitle("로그인하기", for: .normal)
        //왜 .normal이지? setTitle -> 버튼의 상태가 .normal일 때 보여질 텍스트를 로그인하기로 한다.
            button.setTitleColor(.white, for: .normal)
        //버튼의 타이틀 색을 .normal일 때 흰색으로 -.
            button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        //?는 왜 있지? 아까 옵셔널 배웠는데, 버튼의 레이블이 항상 존재하는 것은 아님을 의미하기도 하고 안전하게 접근하기 위함이 크다.
//            button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        // 액션이 발생했을 때, loginButtonDidTap이라는 메소드 호출. 이 메서드 안에서 사용자가 버튼 눌렀을 때 수행할 로직 처리.
        // touchUpInside - 버튼을 누르고 뗄 때 메소드 호출
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        //#selector : objective-C의 유산으로 함수를 직접 지정해서 실행할 때 사용.
        //컴파일시가 아니라, 런타임에서 함수가 실행되는 동적 바인딩 형태.
        //selector쓸 때는, objectiveC와의 호환성을 위해 반드시 해당 함수에 @objc 키워드 붙여주어야 한다.
        //addTarget: cotrolEvent수행 시 실행 주테인 target과 함수를 연결해주는 함수다. 
            return button
        }()
    
    @objc
    private func loginButtonDidTap(){
        pushToWelcomeVC()
    }
    //@objc
    //Swif사용한 코드를 ObjectiveC코드와 상호작용 시키기 위해 쓰는 키워드
    //이 키워드 붙이면 Objective-C, Swift코드에서 사용이 가능해짐.

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
//        welcomeViewController.id = idTextField.text
        welcomeViewController.setLabelText(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    //네비게이션 방식으로 화면 전환하는 방법을 선택.
    //welcome뷰컨에 전역 변수로 선언해준 id의 값에 idTextField.text값을 넣어준다.
    //그리고 네비게이션 컨트롤러의 값이 존재 할 때 push를 해 준다.
    //optional - 값이 있을 수도 ~ 없을 수도
    //선언 시 '타입명 + ?' 옵셔널 변수에 값 할당 시 그 값을 그대로, 반대의 경우 nil
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = .white
            setLayout()
        //setLayout 메서드로 레이아웃 설정을 해준다.
        // setLayout -> 작성해준 UI요소들을 뷰에 추가해준다.
        }
        
        private func setLayout() {
            [titleLabel, idTextField, passwordTextField, loginButton].forEach {
                self.view.addSubview($0)
            }
            //forEach는 각 요소를 순회하면서 컨트롤러 메인 뷰의 서브 뷰로 추가를 해준다. $0은 그럼 뭐지?
            //클로저 내에서 현재 요소를 나타낸다.
        }
    
    //아직 아이디 비밀번호가 너무 앞에 붙어있고, 로그인하기 버튼이 각져있지 않아야 피그마와 동일해진다.
}
