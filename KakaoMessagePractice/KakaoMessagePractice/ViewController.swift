//
//  ViewController.swift
//  KakaoMessagePractice
//
//  Created by 황지은 on 2020/12/29.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet var messageTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchupBtn(_ sender: UIButton) {
        
        let kakaoTalk = "kakaotalk://"

            

            let kakaoTalkURL = NSURL(string: kakaoTalk)

        if UIApplication.shared.canOpenURL(kakaoTalkURL! as URL) {

            UIApplication.shared.openURL(kakaoTalkURL! as URL)

            }

            else {

                print("No kakaostory installed.")

            }



      
//        let template = TextTemplate.init(text: messageTextField.text ?? "안녕하세요", link: Link(), buttonTitle: "체리쉬로 고고", buttons: nil)
        
        
//        // 카카오링크 실행
//        LinkApi.shared.defaultLink(templatable: template) {(linkResult, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("defaultLink() success.")
//                guard let nextVC = self.storyboard?.instantiateViewController(identifier: "NextVC")as? NextVC else {return}
//                self.modalPresentationStyle = .fullScreen
//                self.present(nextVC, animated: true, completion: nil)
//
//
//                if let linkResult = linkResult {
//                    UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
//                }
//            }
//        }
    }
}




