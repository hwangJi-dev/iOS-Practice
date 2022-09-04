//
//  ViewController.swift
//  maskPrac
//
//  Created by hwangJi on 2022/05/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageViewWithMask!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "cat")
        imageView.maskImage = UIImage(named: "Vector 75")
    }
}

