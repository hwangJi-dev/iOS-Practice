//
//  VCControl.swift
//  notificationPractice
//
//  Created by 황지은 on 2020/08/10.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class VCControl: UIViewController {

    @IBOutlet var controlSwitch: UISwitch!
    @IBOutlet var controlTextField: UITextField!
    //var switchValue:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func switchValueChange(_ sender: UISwitch) {
        NotificationCenter.default.post(name: .changeSwitch, object: controlSwitch.isOn)
    }
}
//
extension Notification.Name {
    static let changeSwitch = Notification.Name("changeSwitch")
}
