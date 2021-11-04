//
//  TabBarVC.swift
//  FactoryPractice
//
//  Created by 황지은 on 2021/11/04.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        let homeVC = ViewControllerFactory.viewController(for: .home)
        let addVC = ViewControllerFactory.viewController(for: .add)
        let settingVC = ViewControllerFactory.viewController(for: .setting)
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        addVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "plus.app"), selectedImage: UIImage(systemName: "plus.app.fill"))
        settingVC.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "folder"), selectedImage: UIImage(systemName: "folder.fill"))
        
        // 탭 구성
        let tabs =  [homeVC, addVC, settingVC]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
    }
}
