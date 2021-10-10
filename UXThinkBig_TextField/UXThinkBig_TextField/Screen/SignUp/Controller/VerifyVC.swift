//
//  VerifyVC.swift
//  UXThinkBig_TextField
//
//  Created by 황지은 on 2021/10/10.
//

import UIKit

class VerifyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reusableTextFieldView()
    }
    
    
    func reusableTextFieldView() {
        let textFieldView = ReusableTextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textFieldView)
        textFieldView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textFieldView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        textFieldView.heightAnchor.constraint(equalToConstant: 214).isActive = true
        textFieldView.widthAnchor.constraint(equalToConstant: 366).isActive = true
    }
    
}
