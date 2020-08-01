//
//  ViewController.swift
//  ProgressActivity
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var largeIndicator: UIActivityIndicatorView!
    @IBOutlet var mediumIndicator: UIActivityIndicatorView!
    @IBAction func decreaseOff() {
        self.progressBar.progress -= 0.02
        self.largeIndicator.stopAnimating()
        self.mediumIndicator.stopAnimating()
    }
    @IBAction func increaseOn() {
        self.progressBar.progress += 0.02
        self.largeIndicator.startAnimating()
        self.mediumIndicator.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

