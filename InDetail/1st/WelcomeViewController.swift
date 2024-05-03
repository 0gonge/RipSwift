//
//  WelcomeViewController.swift
//  InDetail
//
//  Created by 송여경 on 4/26/24.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
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
        //.normal : 기본 상태
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        //nil일 가능성이 있고, nil인 경우 더 이상의 메서드 호출이나 속성 접근을 시도하지 않게 된다.
        //title이 nil이 아닌 경우에만 font속성에 접근을 하게 한다.
        //만약 title이 nil이면 font설정은 아예 실행이 되지 않고 프로그램은 nil을 반환 후에 라인을 넘어간다. (nil일 가능성 처리)
        //그러면 이 경우에는 예상치 못하게 titlelabel이 초기화 되지 않아 nil이 된 경우에 예외 없이 잘 실행이 된다.
        //title label이 정상적으로 존재 할 때 글씨체가 적용된다. -> 궁극적인 목표 : 런타임 에러 방지
        //옵셔널 체이닝(Optional chaining이라고 한다.
        //흠 그러면 titlelabel이 어떻게 nil이 아니라고 확신하지?
        return button
    }()
    
    private var backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 58))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
        button.addTarget(self, action: #selector(backToLoginButtonDidTap), for: .touchUpInside)
        return button
        //backgroundColor, titlecolor의 선언방식이 다른 이유가 궁금했다.
        //button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        //색상 값이 직접 할당되므로 UIColor의 인스턴스를 생성하고 해당 인스턴스를 backgroundColor에 직접 설정.
        //button.setTitleColor(UIColor(red: 172/255, green: 176/255, blue: 185/255, alpha: 1), for: .normal
        //두 개의 매개변수를 받는다. 버튼의 상태(.normal, .highlighted, .disabled 등)에 따라 다른 색상을 지정할 수 있기 때문에, 이 메서드는 더 다양한 상황에 맞게 버튼의 텍스트 색상을 조정
        //왜 다른 방식을 사용하지?
        //backgroundColor는 보통 버튼의 상태와 무관하게 일관되게 적용되는 반면, setTitleColor(_:for:)는 버튼의 상태에 따라 다르게 적용될 필요가 있다. 사용자가 버튼을 누를 때(.highlighted)나 사용이 불가능할 때(.disabled) 다른 색상을 보여주고 싶을 수 있다.
        // button.backgroundColor(UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1), for: .normal) 이렇게 쓰면 오류가 나는 이유는?
        //backgroundColor가 UIButton의 속성이자 메서드가 아니라, 단순히 속성(property)이기 때문
        //button.backgroundColor를 메서드처럼 호출하려고 하면, Swift 컴파일러는 이를 잘못된 문법으로 인식하여 오류를 발생
        //setTitleColor(_:for:)는 UIButton 클래스의 메서드

    }()
    
    var id: String?
    //옵셔널로 선언을 해 준다. idTextField.text의 값은 String? 이다.
    //텍스트필드 값이 입력이 되었을 수도~ 아닐 수도.
    //값이 할당 된 옵셔널 변수는 Optional이 감싸져서 나온다!!
    //그럼 안전하게 값을 일치시켜주는 바인딩이 필요할 것 같다.
    //if let, guard let
    
    func setLabelText(id: String?){
        self.id = id
    }
    
    private func bindID(){
        guard let idText = id else{return}
        self.welcomeLabel.text = "\(idText)님 \n반가워요!"
    }
    // 아이디 입력 받을 전역 변수 선언 해주고, 화면의 라벨과 받아온 변수를 연결해줌.
    // 이 함수를 viewDidLoad에서 호출.
    // guard let 구문 사용, nil값일 때는 아무것도 하지 않고, nil 값이 아니라면 그 아래 코드를 통해서 로그인 뷰에서 넘겨받은 id값을 사용. 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setLayout()
        
        bindID()
    }
    
    private func setLayout() {
        [logoImageView, welcomeLabel, goHomeButton, backToLoginButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            // autoresizing mask constraints는 뷰의 크기와 위치를 지정해버리기 때문에, 이후에 추가적인 constraints를 추가할 수 없다.
            //Autolayout을 동적으로 계산해서 사용하고 싶다면, translatesAutoresizingMaskIntoConstraints = false로 지정
            //프로그래밍 방식으로 뷰를 추가하면 translatesAutoresizingMaskIntoConstraints = true이고,
//            
//            
//            
//            translatesAutoresizingMaskIntoConstraints = true이면, autoresizing mask constraints로 뷰의 크기, 위치를 고정하기 때문에 constraint를 추가할 수 없다
            //Autolayout을 위해 false라고 해준다!!
            //
            self.view.addSubview($0)
            //$0는 Swift 클로저에서 매우 유용하게 사용되는 단축 인자 이름으로, 클로저 내부에서 매개변수를 간편하게 참조할 수 있게 해주는 역할
            //$0은 클로저의 첫 번째 매개변수를 대신하여 사용되며, 반복 실행 중 현재 처리되는 배열 요소
            //첫 번째 반복에서는 logoImageView, 두 번째에서는 welcomeLabel, 그리고 세 번째와 네 번째에서 각각 goHomeButton, backToLoginButton
            //그러면 welcomeLabel은 $1로 알아듣나?
            //forEach 메서드에서는 각 반복마다 하나의 요소만을 처리 -> 단일 요소만을 참조한다!! 
            //클로저에 하나의 매개변수만 전달되므로, .forEach 클로저 내에서는 $0만 사용
        }
        
    }
    
    
    @objc
    private func backToLoginButtonDidTap(){
        if self.navigationController == nil{
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    //화면 이동 시, present 이동은 navigationController를 가지지 않고, push이동은 welcomeVC가 navigationController를 가지고 있다. 그래서 이에 따라 분기처리를 해ㅐ 준 것이다. navigationController를 가지고 있으면 pop해주고, 그렇지 않을 경우에 dismiss.
    
}
