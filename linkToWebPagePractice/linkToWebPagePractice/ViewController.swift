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
        
        let blogUrl = NSURL(string: "https://borabong.tistory.com/")
        let blogSafariView: SFSafariViewController = SFSafariViewController(url: blogUrl as! URL)
        self.present(blogSafariView, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToLinkToGithub(_ sender: UIButton) {
        
        let githubUrl = NSURL(string: "https://github.com/hwangJi-dev")
        let githubSafariView: SFSafariViewController = SFSafariViewController(url: githubUrl as! URL)
        self.present(githubSafariView, animated: true, completion: nil)
    }
}

