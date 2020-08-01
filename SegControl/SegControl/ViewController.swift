//
//  ViewController.swift
//  SegControl
//
//  Created by 황지은 on 2020/03/30.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //텍스트필드가 첫번째 반응하는 어떤 역할을 그만두겠다. => 키보드를 사라지게 하는 역할을 함
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var labelDisplay: UILabel!
    @IBOutlet var smartOS: UISegmentedControl!
    @IBOutlet var leftMiddleRight: UISegmentedControl!
    @IBOutlet var beerCoffeeWine: UISegmentedControl!
    @IBOutlet var textOperand1: UITextField!
    @IBOutlet var textOperand2: UITextField!
    @IBOutlet var segOperator: UISegmentedControl!
    @IBOutlet var labelResult: UILabel!
    
    @IBAction func changeSelection(_ sender: UISegmentedControl) {
        //segment가 label일 때
        if sender == self.smartOS || sender == self.leftMiddleRight {
            self.labelDisplay.text = sender.titleForSegment(at: sender.selectedSegmentIndex)
        }
        //segment가 이미지일 때
        else {
            let drinkArray:Array<String> = ["Beer","Coffee","Wine"]
            self.labelDisplay.text = drinkArray[sender.selectedSegmentIndex]
        }
    }
    
    @IBAction func buttonCalculate(_ sender: UIButton) {
        let opd1 = Int(textOperand1.text!)!
        let opd2 = Int(textOperand2.text!)!
        var result = 0
        if(segOperator.selectedSegmentIndex == 0){ result = opd1 + opd2 }
        else if(segOperator.selectedSegmentIndex == 1){
             result = opd1 - opd2
        }
        else if (segOperator.selectedSegmentIndex == 2){
            result = opd1 * opd2
        }
        
        labelResult.text = String(result)
        
        if(segOperator.selectedSegmentIndex == 3){
            let result2 = Double(opd1)/Double(opd2)
            labelResult.text = String(format:"%5.3f",result2)
        }
    }  
}

