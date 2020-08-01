//
//  ViewController.swift
//  Lab03
//
//  Created by 황지은 on 2020/03/30.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var displayLabel: UILabel!
    @IBOutlet var myTextField: UITextField!
    
    @IBAction func buttonDisplay() {
        displayLabel.text = myTextField.text
    }
    
    @IBAction func segmentDisplay(_ sender: UISegmentedControl) {
        displayLabel.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    @IBAction func switchDisplay(_ sender: UISwitch) {
        if sender.isOn {
            displayLabel.text = "Switch is On"
        }
        else {
            displayLabel.text = "Switch is Off"
        }
    }
    
    @IBAction func sliderDisplay(_ sender: UISlider) {
        displayLabel.text = String(format:"%10.8f",sender.value)
    }
    
}


