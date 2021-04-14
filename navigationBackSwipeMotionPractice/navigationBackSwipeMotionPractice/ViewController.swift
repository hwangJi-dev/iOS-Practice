//
//  ViewController.swift
//  navigationBackSwipeMotionPractice
//
//  Created by 황지은 on 2021/04/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBackSwipeMotion()
        // Do any additional setup after loading the view.
    }
    
    func navigationBackSwipeMotion() {
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }


}

