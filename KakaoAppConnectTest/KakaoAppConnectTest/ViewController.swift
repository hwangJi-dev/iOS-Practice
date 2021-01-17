//
//  ViewController.swift
//  KakaoAppConnectTest
//
//  Created by 황지은 on 2020/12/31.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func linkToKakaoTalk(_ sender: UIButton) {
        let kakaoTalk = "kakaotalk://"
        
        let kakaoTalkURL = NSURL(string: kakaoTalk)
    
        if UIApplication.shared.canOpenURL(kakaoTalkURL! as URL) {
        
            UIApplication.shared.openURL(kakaoTalkURL! as URL)
        }
        else {
            print("No kakaostory installed.")
        }
    }
    
}

