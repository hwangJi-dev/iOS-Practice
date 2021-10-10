//
//  ReusableTextFieldView.swift
//  UXThinkBig_TextField
//
//  Created by 황지은 on 2021/10/10.
//

import UIKit

class ReusableTextFieldView: UIView {
    
    let xibName = "ReusableTextFieldView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
    }
    
}
