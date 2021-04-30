//
//  ViewController.swift
//  textfieldBackgroundImageChange
//
//  Created by 황지은 on 2021/04/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTextfieldBackgroundImage()
        // Do any additional setup after loading the view.
    }
    
    // 텍스트필드의 백그라운드 이미지를 변경하는 함수
    func changeTextfieldBackgroundImage() {
        
        myTextfield.background = UIImage(named: "letter")
        myTextfield.layer.borderColor = .none
        
        myTextfield.layer.borderWidth = 0
    }


}

