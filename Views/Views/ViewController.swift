//
//  ViewController.swift
//  Views
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorView: UIView!
    @IBOutlet var segSubView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateColor(_ sender: UISlider) {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    

    @IBAction func toggleView(_ sender: UISwitch) {
        self.segSubView.isHidden = !sender.isOn
    }
    
}

