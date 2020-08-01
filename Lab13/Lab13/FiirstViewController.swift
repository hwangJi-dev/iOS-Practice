//
//  FiirstViewController.swift
//  Lab13
//
//  Created by 황지은 on 2020/06/21.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FiirstViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addCoffee() {
        
        appDelegate.coffee.append("커피 하나 추가요 ~")
        print(appDelegate.coffee)
        
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        let tabController = sceneDelegate.window?.rootViewController as! UITabBarController
        let coffeeTab = tabController.tabBar.items![1]
        coffeeTab.badgeValue = String(format: "%d", appDelegate.coffee.count)
        
    }
    
    @IBAction func addCocktail() {
    
        
        appDelegate.cocktail.append("칵테일 하나 추가요 !!")
        print(appDelegate.cocktail)
        
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        let tabController = sceneDelegate.window?.rootViewController as! UITabBarController
        let cocktailTab = tabController.tabBar.items![2]
        cocktailTab.badgeValue = String(format: "%d", appDelegate.cocktail.count)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
