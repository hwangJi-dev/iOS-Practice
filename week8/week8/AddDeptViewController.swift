//
//  AddDeptViewController.swift
//  week8
//
//  Created by 황지은 on 2020/05/17.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class AddDeptViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textAddedDept: UITextField!
    
    //상위 뷰의 controller포인터를 저장하고 있다가 학과 입력이 완료되면 상위 뷰의 public변수에 학과명을 전달
    var deptVC:UITableViewController? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textAddedDept.text = textField.text
        return true
    }

    @IBAction func addDepartment() {
        if let targetVC = deptVC as? DeptTableViewController {
            targetVC.addedDept = self.textAddedDept.text
            //현재의 입력 View를 코드를 통해 pop up시킴
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    

}
