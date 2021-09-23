//
//  TBC.swift
//  tabBar
//
//  Created by 황지은 on 2021/09/22.
//

import UIKit

class TBC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setTabBar() {
        
        self.tabBar.tintColor = .blue
        
        // 탭바 스타일 설정
        tabBar.tintColor = .black
        tabBar.frame.size.height = 65
        tabBar.layer.shadowOpacity = 0
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.barTintColor = .white
        
        // 메인탭
        let WhaleMain = UIStoryboard.init(name: "Main", bundle: nil)
        guard let firstTab = WhaleMain.instantiateViewController(identifier: "ViewController") as? ViewController else {return}
        
        firstTab.tabBarItem.image = UIImage(systemName: "folder")
        firstTab.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        firstTab.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0)
        
        
        // 칭찬카드탭
        let PraiseCardTab = UIStoryboard.init(name: "Main", bundle: nil)
        guard let secondTab = PraiseCardTab.instantiateViewController(identifier: "ViewController2")
                as? ViewController2  else {
            return
        }
        secondTab.tabBarItem.image = UIImage(systemName: "folder")
        secondTab.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        secondTab.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0)
        
        
        // 레벨탭
        let WhaleLevel = UIStoryboard.init(name: "Main", bundle: nil)
        guard let thirdTab = WhaleLevel.instantiateViewController(identifier: "ViewController3")
                as? ViewController3 else {
            return
        }
        thirdTab.tabBarItem.image = UIImage(systemName: "folder")
        thirdTab.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        thirdTab.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0)
        
//        // 레벨탭
        let WhaleLevel4 = UIStoryboard.init(name: "Main", bundle: nil)
        guard let thirdTab4 = WhaleLevel4.instantiateViewController(identifier: "ViewController4")
                as? ViewController4 else {
            return
        }
        thirdTab4.tabBarItem.image = UIImage(systemName: "folder")
        thirdTab4.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        thirdTab4.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0)

        // 레벨탭
        let WhaleLevel5 = UIStoryboard.init(name: "Main", bundle: nil)
        guard let thirdTab5 = WhaleLevel5.instantiateViewController(identifier: "ViewController5")
                as? ViewController5 else {
            return
        }
        thirdTab5.tabBarItem.image = UIImage(systemName: "folder")
        thirdTab5.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        thirdTab5.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -8.5, right: 0)

        
        // 탭 구성
        let tabs =  [firstTab, secondTab, thirdTab, thirdTab4, thirdTab5]
        
        // VC에 루트로 설정
        self.setViewControllers(tabs, animated: false)
    }
}
