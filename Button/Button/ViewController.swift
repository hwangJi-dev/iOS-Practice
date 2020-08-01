//
//  ViewController.swift
//  Button
//
//  Created by 황지은 on 2020/03/30.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var number1: UILabel!
    @IBOutlet var number2: UILabel!
    @IBOutlet var number3: UILabel!
    @IBOutlet var number4: UILabel!
    @IBOutlet var number5: UILabel!
    @IBOutlet var number6: UILabel!
    @IBOutlet var sliderRed: UISlider!
    @IBOutlet var sliderGreen: UISlider!
    @IBOutlet var sliderBlue: UISlider!
    
    
    
    @IBAction func drawLotto() {
        var originalNumbers = Array(1...45)
        var index = 0
        var lottoArray = Array<Int>()
        
        for _ in 0...5 {
            index = Int(arc4random_uniform(UInt32(originalNumbers.count)))
            print(index)
        lottoArray.append(originalNumbers[index])
            originalNumbers.remove(at: index)
        }
        
        number1.text = String(lottoArray[0])
        number2.text = String(lottoArray[1])
        number3.text = String(lottoArray[2])
        number4.text = String(lottoArray[3])
        number5.text = String(lottoArray[4])
        number6.text = String(lottoArray[5])
    }
    
    
    
    var switchArray:Array<Int> = Array(repeating: 0, count: 6) // [0,0,0,0,0,0]
    //전역변수
    
    @IBAction func toggleSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            number1.text = String(switchArray[0])
            number2.text = String(switchArray[1])
            number3.text = String(switchArray[2])
            number4.text = String(switchArray[3])
            number5.text = String(switchArray[4])
            number6.text = String(switchArray[5])
        }
        else {
            switchArray[0] = Int(number1.text!)!
            switchArray[1] = Int(number2.text!)!
            switchArray[2] = Int(number3.text!)!
            switchArray[3] = Int(number4.text!)!
            switchArray[4] = Int(number5.text!)!
            switchArray[5] = Int(number6.text!)!
            
            number1.text = "0"
            number2.text = "0"
            number3.text = "0"
            number4.text = "0"
            number5.text = "0"
            number6.text = "0"
        }
   
    }
    
    @IBAction func updateColor(_ sender: UISlider) {
        
        
        self.view.backgroundColor = UIColor.init(red: CGFloat(self.sliderRed.value),
                                                 green: CGFloat(self.sliderGreen.value), blue: CGFloat(self.sliderBlue.value), alpha: 1.0)
        
    }
    
     
}

