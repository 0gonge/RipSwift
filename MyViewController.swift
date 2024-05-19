//
//  MyViewController.swift
//  InDetail
//
//  Created by 송여경 on 5/19/24.
//

import UIKit

class MyViewController: UIViewController {
    
    convenience init(title: String, bgColor: UIColor){
        self.init()
        self.title = title //외부에서 받은 title을 넣어주겠다.
        self.view.backgroundColor = bgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
