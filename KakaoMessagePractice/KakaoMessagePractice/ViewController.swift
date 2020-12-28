//
//  ViewController.swift
//  KakaoMessagePractice
//
//  Created by 황지은 on 2020/12/29.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKLink
import KakaoSDKTemplate


class ViewController: UIViewController {
    
    @IBOutlet var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchupBtn(_ sender: UIButton) {
        let template = TextTemplate.init(text: messageTextField.text ?? "안녕하세요", link: Link(), buttonTitle: "체리쉬로 고고")
        // 카카오링크 실행
        LinkApi.shared.defaultLink(templatable: template) {(linkResult, error) in
            if let error = error {
                print(error)
            }
            else {
                print("defaultLink() success.")
                
                if let linkResult = linkResult {
                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                }
            }
        }
    }
}




