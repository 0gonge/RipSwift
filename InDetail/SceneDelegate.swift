//
//  SceneDelegate.swift
//  InDetail
//
//  Created by 송여경 on 4/25/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    //?를 쓰는 이유 : 변수가 Optinal이다. 옵셔널은 변수가 값을 가질 수도 있고, nil(값X)를 가질 수도 있다.
    // 변수가 어떤 시점에 값을 가지지 않을 수도 있다는 가능성을 허용.
    var window: UIWindow?
    // window가 UIWindow를 참조할 수 도 있고 참조하지 않을 수도 있다는 말!
    // 옵셔널을 안전하게 접근하게 해주는게 if let, guard let이라는 것을 염두에 두자.
    // 필요할 때 변수를 nil로 주어 메모리를 효율적으로 관리하는 것도 가능하다.

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // SceneDelegate가 반드시 구현해야 하는 UIWindowSceneDelegate프로토콜의 일부이다.
        // 앱의 씬이 활성화 될 때 호출된다.
        // 파라미터 : scene : 현재 활성화 되는 씬. / session 씬의 데이터를 포함. / options 씬 연결 할 때 추가적인 옵션을
        // 포함한다는 말이다. 흠.. 추가적인 옵션이 뭐지? URL같은 거라고 한다.
        
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
    // 2. 안전하게 guard let으로 포장을 해준 모습이다.
        // scene 인스턴스를 UIWindowScene 타입으로 받아주고, 이게 아닐 경우 (scene이 uiwindowscene이 아닐 경우) 진행을 하지 않는다.
        self.window = UIWindow(windowScene: windowScene)
    // 3.UIWindow를 초기화 해주고 있다. UIWindow인스턴스를 생성해주고, 이를 windowScene에 연결을 해주었다.
        let navigationController = UINavigationController(rootViewController: ViewController())
        // UINavigationController인스턴스도 생성해주었다. 다음 이 네비게이션 컨트롤러의 root View controller로
        //**  rootViewController는 storyboard상에서 IsInitialViewController 로 설정해주는 것과 유사합니다!
        self.window?.rootViewController = navigationController
    // 4. 새로운viewController인스턴스를 설정해주었다.
        self.window?.makeKeyAndVisible()
        // window를 화면에 표시하고 이를 keywindow로 설정해주는 것이디ㅏ. 키는 사용자의 입력을 받는다는 말이라고 생각하자.
        // keywindow가 뭐지?
        // key window: window가 여러개 존재할 때, 가장 앞쪽에 배치된 window를 `key window`라고 지칭한다.

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // 시스템에 의해서 scene이 해제되면 호출이된다. Scene이 background에 들어간 직후나 session이 삭제되었을 때 호출된다. 다음 번에 해당 scene에 연결되는 경우에 새로 생성되는 자료들과 관련된 모든 자료들을 해제해준다.Session이 반드시 삭제되는 것은 아니므로 scene은 나중에 다시 연결될 수도 있다.
        //다음에 다시 연결될 수 있다는 점이 흥미롭다.
        // 씬과 관련된 리소스 해제
        // 예를 들어, 씬별로 개별적으로 관리되는 데이터베이스 연결을 닫거나,
        // 임시 파일을 삭제하는 등의 작업을 여기서 처리가 가능하다.
        // 왜쓰지? 사용자가 여러 창을 사용해 앱을 사용하는 경우, 외부 디스플레이를 이용해 앱을 실행하는 경우 등의 다양한 환경을 보장해준다!!
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    //

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Scene이 활성화 되었고 현재 사용자 이벤트에 응답하고 있음을 알린다.인터페이스를 로드 한 후 인터페이스가 화면에 표시되기 전에 호출된다
        // 비활성 -> 활성 때 호출
        // 사용자 인터페이스 갱신해주는 기능도 한다. 씬이 활성화 되어야 하는데 이때 최신 상태여야 할 때. 여기에서 업데이트 수행 가능.
        // 리소스가 비활성때는 필요하지 않지만 활성화되면 필요한 경우에도 여기서 관리를 해준다.
        // ex. 타이머 재 실행
        // 데이터 새로 고침, UI update
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Scene이 활성상태를 해제하고 사용자 이벤트에 대한 응답을 중지하려고 함을 알린다.시스템 경고를 표시 할 때와 같은 일시적인 중단을 위해 이 메서드를 호출한다
        // 이 메서드가 반환 될 때까지 앱은 백그라운드 또는 포그라운드로 다시 전환되기를 기다리는 동안 최소한의 작업을 수행해야 한다.
        // Resign - 사직하다.
        // 게임에서 이 메소드를 통해 게임 정지도 가능.
        // // 예를 들어, 앱에서 실행 중인 비디오나 오디오 재생을 일시 중지.
        // player.pause()
        
        // 중요한 데이터는 저장.
        // saveImportantData()
        // 다시 활성화 되는 상황을 수행해주어야 함.
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // scene이 foreground에서 실행되고, 사용자에게 표시 될 것임을 delegate에게 알립니다.이 전환은 새로 생성되고 연결된 scene뿐만아니라 background에서 실행 중이고, 시스템 또는 사용자 작업에 의해 background로 가져온 scene 모두에 대해 발생합니다.scene이 화면에 표시되기 위해 foreground에 들어가므로 이 메서드는 항상 sceneDidBecomeActive (_ :) 메서드를 호출합니다.
        // 백그라운드 상태에서 수행했던 변경사항을 되돌리거나 사용자가 앱을 다시 사용할 준비가 되도록 하는데 사용.
        // UI갱신 네트워크 활동 재개 - 백그라운드 상태에서 중단했던 네트워크 호출을 재개하거나 백그라운드에서 수신한 데이터를 처리함.
        // 약간 잘 안와닿아서 예시를 가져왔다. UI 최신 상태로 갱신, 백그라운드에서 비활성화 했던 기능 다시 활성화 등등을 예로 들 수 있겠다.
        // 메소드는 앱이 사용자와의 상호작용을 재개하기 전에 필요한 준비를 하도록 돕고, 이 메소드를 통해 앱은 백그라운드에서의 변화나 상태를 적절히 관리하고, 사용자가 앱을 다시 활용할 때 최적의 경험을 제공할 수 있기 때문에 쓰이는 것이다.
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Scene이 background에서 실행되고 더 이상 화면에 표시되지 않음을 Delegate에게 알립니다.이 방법을 사용하여, scene의 메모리 사용량을 줄이고, 공유 리소스를 확보하며, scene의 사용자 인터페이스를 정리합니다.이 메서드가 반환 된 직후 UIKit은 앱 전환기에 표시하기 위해 Scene의 인터페이스의 스냅 샷을 찍습니다.
        // 리소스 해제 및 상태 정보를 저장한다.
        // 결론적으로 이는 사용자가 앱을 다시 열었을 때 이전의 경험을 쉽게 이어갈 수 있게 해준다.
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

