//
//  ViewController.swift
//  removeImageBg
//
//  Created by 황지은 on 2021/09/27.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    @IBOutlet var jieunImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jieunImage.image = removeBackground(image: (jieunImage.image ?? .remove))
    }
    
    func removeBackground(image: UIImage) -> UIImage {
        return image.removeBackground(returnResult: .finalImage) ?? .remove
    }
}

