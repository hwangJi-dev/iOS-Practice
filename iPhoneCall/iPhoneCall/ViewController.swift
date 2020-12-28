//
//  ViewController.swift
//  iPhoneCall
//
//  Created by 황지은 on 2020/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func touchUpForCalling(_ sender: UIButton) {
        let number:Int = 01093013163
        if let url = NSURL(string: "tel://0" + "\(number)"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
}

