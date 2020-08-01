//
//  ViewController.swift
//  Navigationto1
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBOutlet var pizzaChicken: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderView"{
            let destVC = segue.destination as! OrderViewController
            
            let ordered:String! = pizzaChicken.titleForSegment(at: pizzaChicken.selectedSegmentIndex)
            
            destVC.title = ordered
            
            var outString:String="감사합니다!!\n 주문내역:<"
            outString += ordered
            outString += ">, 맞나요?"
            destVC.info = outString
        }
    }
    
}

