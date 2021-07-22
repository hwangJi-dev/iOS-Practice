//
//  customVC.swift
//  pickerViewCustomPractice
//
//  Created by 황지은 on 2021/07/22.
//

import UIKit
@IBDesignable
class CustomPickerView: UIPickerView
{
    @IBInspectable var selectorColor: UIColor?
    
    override func insertSubview(_ view: UIView, at index: Int) {
        super.insertSubview(view, at: 1)
        view.layer.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
        self.sendSubviewToBack(subview)
        subview.layer.backgroundColor = CGColor(red: 1, green: 212/255, blue: 100/255, alpha: 1)
    }
}


class customVC: UIViewController {

    @IBOutlet var setBtn: UIButton!
    @IBOutlet var popupView: UIView!
    @IBOutlet var customPickerView: UIPickerView!
    var menuArray:[String] = ["2020년","치킨","닭강정","샌드위치","고기","파스타"]
    var clothArray:[String] = ["전체","하의","치마","바지","니트","양말","신발"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBtn.layer.cornerRadius = 20
        popupView.layer.cornerRadius = 20
        customPickerView.delegate = self
        customPickerView.dataSource = self
    
       // customPickerView.subviews[0].subviews[0].subviews[0].backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */

}

extension customVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return menuArray.count
        }
        else {
            return clothArray.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return menuArray[row]
        }
        else {
            return clothArray[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.tintColor = .black
    }
}
