//
//  TabBarController.swift
//  TabBarBackgroundColorChange
//
//  Created by 황지은 on 2021/04/12.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarBackgroundColor()
    }
    

    func setTabBarBackgroundColor() {
        tabBar.barTintColor = .purple
        tabBar.isTranslucent = false
    }
}
