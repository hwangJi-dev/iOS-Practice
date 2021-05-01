//
//  TabBarController.swift
//  tabBarConnectByCode
//
//  Created by 황지은 on 2021/05/01.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setTabBar()
    }
    
    // MARK: - 탭바 만드는 함수
    
    func setTabBar() {
        
        self.tabBar.tintColor = UIColor.black
        self.tabBar.frame.size.height = 55
        
        
        /// 마이페이지탭
        let First = UIStoryboard.init(name: "First", bundle: nil)
        guard let firstTab = First .instantiateViewController(identifier: "FirstViewController")
                as? FirstViewController  else {
            return
        }
        
        firstTab.tabBarItem.image = UIImage(named: "icnMypageUnselected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        firstTab.tabBarItem.selectedImage = UIImage(named: "icnMypageSelected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
        /// 더보기탭
        let Second = UIStoryboard.init(name: "Second", bundle: nil)
        guard let secondTab = Second.instantiateViewController(identifier: "SecondViewController")
                as? SecondViewController  else {
            return
        }
        
        secondTab.tabBarItem.image = UIImage(named: "icnMoreUnselected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        secondTab.tabBarItem.selectedImage = UIImage(named: "icnMoreSelected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        
        
        // 메인탭
        let Third = UIStoryboard.init(name: "Third", bundle: nil)
    
        guard let thirdTab = Third.instantiateViewController(identifier: "ThirdViewController")
                as? ThirdViewController  else {
            return
        }
        
        thirdTab.tabBarItem.image = UIImage(named: "icnMoreUnselected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
        thirdTab.tabBarItem.selectedImage = UIImage(named: "icnMoreSelected")?.withAlignmentRectInsets(UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0))
                
        let tabs =  [firstTab, secondTab, thirdTab]
                
        
    }

}
