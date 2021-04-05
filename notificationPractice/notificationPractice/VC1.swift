//
//  VC1.swift
//  notificationPractice
//
//  Created by 황지은 on 2020/08/10.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class VC1: UIViewController {

    @IBOutlet var switch1: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(change1), name: .changeSwitch, object: nil)
        
    }
   
    
    @objc func change1(_ notification: Notification) {
        let isValue = notification.object as! Bool
        switch1.isOn = isValue
        print(isValue)
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
