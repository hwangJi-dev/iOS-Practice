//
//  switchViewController.swift
//  Lab04
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class switchViewController: UIViewController {

    
    @IBOutlet var onOffSwitch: UISwitch!
    @IBOutlet var displayLabel: UILabel!
    var onOffStatus:Bool! //Null값이 아닌 상태로 선언
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if onOffStatus == true {
            displayLabel.text = "Switch is ON"
            onOffSwitch.isOn = true
        }
        else {
            displayLabel.text = "Switch is OFF"
            onOffSwitch.isOn = false
        }
     
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
