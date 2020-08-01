//
//  ViewController.swift
//  Lab04
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var onOffSwitch: UISwitch!
    @IBOutlet var leftRightSegControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSwitchView" {
            let destVC = segue.destination as! switchViewController
            destVC.onOffStatus = onOffSwitch.isOn
      
        }
        else if segue.identifier == "toSegmentView"{
            let destVC = segue.destination as! segControlViewController
            destVC.selectedSegmentIndex_segControlview = leftRightSegControl.selectedSegmentIndex
           
        }
    }

}

