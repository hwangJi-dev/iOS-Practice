//
//  ViewController.swift
//  Lab02
//
//  Created by 황지은 on 2020/03/23.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender:UIButton) {
        let entered: String! = sender.titleLabel?.text
        let current: String! = displayLabel.text
        
        
        if current == "0" {
            if entered == "0" || entered == "C" {
                displayLabel.text = "0"
            }
            else {
                displayLabel.text = entered
            }
        }
        
        else {
            if entered == "C" {
                displayLabel.text = "0"
            }
            else {
                displayLabel.text = current + entered
            }
        }
}
}


