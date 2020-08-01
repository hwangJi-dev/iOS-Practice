//
//  ViewController.swift
//  Lab05
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return yearMonthArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return yearMonthArray[row]
    }
    

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var buttonChristmas: UIButton!
    @IBOutlet var buttonIndependence: UIButton!
    @IBOutlet var buttonMemorial: UIButton!
    @IBOutlet var buttonNewYear: UIButton!
    @IBOutlet var hiddenView: UIView!
    @IBOutlet var pickerView: UIPickerView!
    
    let yearMonthArray:Array<String> = ["1월 1일","6월 6일","8월 15일","12월 25일"]
    var started:Bool!
    
    
    @IBAction func buttonStart(_ sender: UIButton) {
        
        activityIndicator.startAnimating()
        started = true
        hiddenView.isHidden = true
    }
    
    @IBAction func buttonHoliday(_ sender: UIButton) {
        
        let stringIndex:String = yearMonthArray[self.pickerView.selectedRow(inComponent: 0)]
        if started == true {
            if stringIndex == "1월 1일" && sender == buttonNewYear ||
                       stringIndex == "6월 6일" && sender == buttonMemorial  ||
                       stringIndex == "8월 15일" && sender == buttonIndependence  ||
                       stringIndex == "12월 25일" && sender == buttonChristmas  {

                       hiddenView.isHidden = false
                       started = false
                       activityIndicator.stopAnimating()
                   }
        }
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hiddenView.isHidden = true
        started = false
    }
}

