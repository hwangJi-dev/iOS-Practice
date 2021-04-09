//
//  ViewController.swift
//  KakaoAppConnectPractice
//
//  Created by 황지은 on 2021/04/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpToConnectKakaotalk(_ sender: UIButton) {
        let kakaoTalk = "kakaotalk://"
        let kakaoTalkURL = NSURL(string: kakaoTalk)
        
        if (UIApplication.shared.canOpenURL(kakaoTalkURL! as URL)) {
    
            UIApplication.shared.open(kakaoTalkURL! as URL)
        }
        else {
            print("No kakaotalk installed.")
        }
    }
}

