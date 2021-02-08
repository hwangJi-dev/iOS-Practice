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
        
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @IBAction func touchUpForCalling(_ sender: UIButton) {
        let number:Int = 01011111111
        if let url = NSURL(string: "tel://0" + "\(number)"),
           UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    // 앱 background시 호출
    @objc func didEnterBackground() {
        print("didEnterBackgroud")
        
        let AfterCallingVC = self.storyboard?.instantiateViewController(identifier: "AfterCallingVC") as! AfterCallingVC
        self.modalPresentationStyle = .fullScreen
        self.present(AfterCallingVC, animated: true, completion: nil)
    }
    
}

