//
//  MainTabBarController.swift
//  InDetail
//
//  Created by 송여경 on 5/19/24.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MainTabBarController - viewDidLoad() called")
        
        let firstNC = UINavigationController.init(rootViewController: MyViewController(title: "첫번째", bgColor: .black))
        let secondNC = UINavigationController.init(rootViewController: MyViewController(title: "두번째", bgColor: .orange))
        let thirdNC = UINavigationController.init(rootViewController: MyViewController(title: "세번째", bgColor: .yellow))
        let forthNC = UINavigationController.init(rootViewController: MyViewController(title: "네번째", bgColor: .green))
        let fifthNC = UINavigationController.init(rootViewController: MyViewController(title: "다섯번째", bgColor: .purple))
        
        self.viewControllers = [firstNC, secondNC, thirdNC, forthNC, fifthNC] //위에서 정의한 navigationController를 하나씩 넣어줌.
        
        let firstTabBarItem = UITabBarItem(title: "첫번째", image: UIImage(systemName: "airplayaudio"), tag:0)
        let secondTabBarItem = UITabBarItem(title: "두번째", image: UIImage(systemName: "airplayvideo"), tag:1)
        let thirdTabBarItem = UITabBarItem(title: "세번째", image: UIImage(systemName: "arrow.colckwise.icloud.fill"), tag:2)
        let forthTabBarItem = UITabBarItem(title: "네번째", image: UIImage(systemName: "arrow.down.left.video.fill"), tag:3)
        let fifthTabBarItem = UITabBarItem(title: "다섯번째", image: UIImage(systemName: "safari.fill"), tag:4 )
        //item설정 끝
        //각 navigationcontroller에 tabbar item설정
        
        firstNC.tabBarItem = firstTabBarItem
        secondNC.tabBarItem = secondTabBarItem
        thirdNC.tabBarItem = thirdTabBarItem
        forthNC.tabBarItem = forthTabBarItem
        fifthNC.tabBarItem = fifthTabBarItem
        
    }
}
//MainTabbarController를 SceneDelegate에서 써줄 것임.
