//
//  ViewController.swift
//  emailTest
//
//  Created by 황지은 on 2021/02/07.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertController(title: "메일을 전송 실패", message: "아이폰 이메일 설정을 확인하고 다시 시도해주세요.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) {
            (action) in
            print("확인")
        }
        sendMailErrorAlert.addAction(confirmAction)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    @IBAction func sendEmailTapped(_ sender: UIButton) {
        
        if MFMailComposeViewController.canSendMail() {
            
            let compseVC = MFMailComposeViewController()
            compseVC.mailComposeDelegate = self
            
            compseVC.setToRecipients(["melon2228@naver.com"])
            compseVC.setSubject("Message Subject")
            compseVC.setMessageBody("Message Content", isHTML: false)
            
            self.present(compseVC, animated: true, completion: nil)
            
        }
        else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

