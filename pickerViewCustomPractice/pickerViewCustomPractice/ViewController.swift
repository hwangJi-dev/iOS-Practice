//
//  ViewController.swift
//  pickerViewCustomPractice
//
//  Created by 황지은 on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var customView: UIView!
    @IBOutlet var customPicker: UIDatePicker!
    @IBOutlet var customPickerView: UIPickerView!
    var menuArray:[String] = ["피자","치킨","닭강정","샌드위치","고기","파스타"]
    var clothArray:[String] = ["상의","하의","치마","바지","니트","양말","신발"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.layer.cornerRadius = 20
        customView.layer.shadowPath = CGPath(rect: CGRect(x: 10, y: 10, width: 10, height: 10), transform: nil)
        customView.layer.borderWidth = 0.5
        customView.layer.borderColor = CGColor(red: 255/255, green: 233/255, blue: 122/255, alpha: 1.0)
        
        customPicker.subviews[0].subviews[1].backgroundColor = UIColor(
                    red: 0.506, green: 0.886, blue: 0.824, alpha: 0.15)
        
       
//        customPickerView.setValue(UIColor.white, forKey: "backgroundColor")

    //
      //  change()
    }
    
    func change() {
        for subview in self.customPickerView.subviews {

                if subview.frame.height <= 5 {

                    subview.backgroundColor = UIColor.red
                    subview.tintColor = UIColor.red
                    subview.layer.borderColor = UIColor.white.cgColor
                    subview.layer.borderWidth = 0.5            }
            }

            if let pickerView = self.customPickerView.subviews.first {

                for subview in pickerView.subviews {

                    if subview.frame.height <= 5 {

                        subview.backgroundColor = UIColor.red
                        subview.tintColor = UIColor.red
                        subview.layer.borderColor = UIColor.white.cgColor
                        subview.layer.borderWidth = 0.5
                    }
                }
                self.customPickerView.setValue(UIColor.red, forKey: "textColor")
            }
    }
    

//
}

//extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            return months.count
//        }
//        else {
//            return months.count
//        }
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return months[row]
//        }
//        else {
//            return months[row]
//        }
//    }
//
//
//}
