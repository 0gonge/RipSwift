//
//  ViewController.swift
//  InDetail
//
//  Created by 송여경 on 4/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    enum MacBook{
        case name(String)
        case price(Int)
    }

    var brand = MacBook.name("M3")
    var offer = MacBook.price(4000000)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(brand)
        print(offer)

    }
}
