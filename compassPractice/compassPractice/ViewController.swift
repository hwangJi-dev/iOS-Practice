//
//  ViewController.swift
//  compassPractice
//
//  Created by 황지은 on 2021/05/16.
//

import UIKit

class ViewController: UIViewController {
    
    var compassHeading = CompassHeading ()
    @IBOutlet var compassImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        compassImageView.transform = compassImageView.transform.rotated(by: CGFloat(self.compassHeading.degrees))

    }

}

