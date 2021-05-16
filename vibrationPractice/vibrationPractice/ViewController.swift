//
//  ViewController.swift
//  vibrationPractice
//
//  Created by 황지은 on 2021/05/16.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        vibrate()
        // Do any additional setup after loading the view.
    }
    func vibrate() {
        for i in 0...20 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(Double(i) * 0.1 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
                self.vibrate()
            })
        }
    }

}

