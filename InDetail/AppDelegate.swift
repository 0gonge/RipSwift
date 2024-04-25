//
//  AppDelegate.swift
//  InDetail
//
//  Created by 송여경 on 4/25/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //application(_:didFinishLaunchingWithOptions:) : 이 메소드는 앱이 처음 시작될 때 호출됩니다. 이 메소드에서는 앱의 초기 설정을 수행하거나, 앱의 주요 화면을 설정하는 등의 작업을 수행.
    
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            //앱 시작 시 제공되는 옵션들을 담고 있는 딕셔너리. 이 옵션들은 앱이 푸시 노티피케이션을 통해 열렸는지, URL을 통해 열렸는지의 정보를 포함할 수 있고 key는 보면 알 수 있듯, UIApplication.LaunchOptionsKey이다.
            //이 메소드는 Bool 값을 전달하고, 앱이 정상적으로 작동하는지를 , 시작되었는지를 알리기 위해 true값으로 반환을 해준다.
            // Override point for customization after application launch.-> 이 주석은 사용자 설정을 추가하기 좋은 위치임을 알려주는 곳이다. (앱 초기화 후에-)여기에서 흥미로운 점은 여기에서 애플리케이션의 기본 UI구성을 세팅할 수 있다는 점이다.
            return true
            //만약 리턴 값이 false일 때는, 앱이 시작되지 않아야 함을 의미하고, 시스템이 앱의 실행을 중지한다.
        }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        //application은 UIApplication의 인스턴스로 앱 자체를 의미한다.
        //connectingSceneSession은 생성되는 새로운 UISession객체로, 새로운 Scene의 구성과 관련된 정보를 가지고 있다.
        //options: scene을 설정할 때 사용되는 추가 옵션을 포함하는 UIScene.ConnectionOptions. 이 옵션에는 사용자가 scene을 시작하는 방법(예: URL, 퀵 액션 등)과 관련된 데이터가 포함될 수 있다고 한다.
        
        //그렇다면 이 전체 메소드의 기능은, 새 scene이 호출될 때 (연결될 때) 실행된다고 볼 수 있다.
        //UISceneConfiguration에서 새로 연결되는 씬을 정의해준다
        // UISceneConfiguration은 scene의 세션 유형, 연결할 view controller를 지정할 수 있도록 해준다.
        //name: UISceneConfiguration을 찾거나 생성할 때 사용되는 이름입니다. 이 이름은 앱의 Info.plist 파일 내에서 미리 정의된 configuration 설정과 일치해야 합니다.
        //sessionRole: scene의 역할을 정의. 예를 들어, windowApplication (일반적인 앱 화면), windowExternalDisplay (외부 디스플레이에 표시), streamingSession (스트리밍 세션) 등.
        //이 메소드를 통해 앱이 다중 창 환경을 지원할 수 있으며, 같은 앱에서 여러 작업을 동시에 수행이 가능해진다. 예를 들어, iPad에서 같은 앱의 두 개의 다른 문서를 병렬로 작업하는 경우가 있다. 각 scene은 독립적으로 메모리나 상태를 관리한다!!
        //다중 태스킹에 유용하다.
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // 간단히 말해서 scene이 더 이상 사용되지 않을 때 호출
        // 사용자가 scene 종료하거나 더 이상 필요가 없어지게 된 경우 자동으로 종료될 때 호출이 된다.
        // 그렇기 때문에 sceneSesssions에는 제거된 UI씬들이 모여있다.
        // 여기에서는 이 메소드는 뭘 해줄 것이냐?
        // 바로바로 메모리 해제 하고, 씬에 연결되어있는 리소스들도 해제를 해준다. 그러면 캐시도 클린해지겠지?
        // 상태 저장도 가능하고, 로깅이나 분석 시에도 활용이 가능하다. scene이 종료된 원인, 아니면 시점을 로깅하여 앱의 분석 데이터에 기록할 수 있다.
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        // 버렸으니까 리턴은 없다~!
    }


}

