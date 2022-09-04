//
//  ViewController.swift
//  iOS16
//
//  Created by hwangJi on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    @IBAction func pushToVC(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextVC") as? NextVC else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}

