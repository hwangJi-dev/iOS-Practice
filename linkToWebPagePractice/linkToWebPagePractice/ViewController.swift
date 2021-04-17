//
//  ViewController.swift
//  linkToWebPagePractice
//
//  Created by 황지은 on 2021/04/17.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpToLinkToBlog(_ sender: UIButton) {
        
        let url = NSURL(string: "https://borabong.tistory.com/")
        let safari: SFSafariViewController = SFSafariViewController(url: url as! URL)
        self.present(safari, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToLinkToGithub(_ sender: UIButton) {
        
        let url = NSURL(string: "https://github.com/hwangJi-dev")
        let safari: SFSafariViewController = SFSafariViewController(url: url as! URL)
        self.present(safari, animated: true, completion: nil)
    }
}

