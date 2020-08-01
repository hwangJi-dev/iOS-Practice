//
//  ViewController.swift
//  CostomPicker
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return yearArray.count
        }
        else{
            return deptArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return yearArray[row]
        }
        else{
            return deptArray[row]
        }
    }
    

    @IBOutlet var labelInfo: UILabel!
    @IBOutlet var pickerCollege: UIPickerView!
    
    let yearArray: Array<String> = ["1학년","2학년","3학년","4학년"]
    let deptArray: [String] = ["디지털미디어학과","정보보호학과","소프트웨어융합학과","경영학과","패션산업학과","산업디자인학과"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getValue() {
        let year:String = yearArray[self.pickerCollege.selectedRow(inComponent: 0)]
        let dept:String = deptArray[self.pickerCollege.selectedRow(inComponent: 1)]
        
        labelInfo.text = year + "," + dept
    }
}

