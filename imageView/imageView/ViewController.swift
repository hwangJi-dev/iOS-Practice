//
//  ViewController.swift
//  imageView
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var candleImageView: UIImageView!
    @IBOutlet var candleLabelStatus: UILabel!
    
    let candleOffImage = UIImage(named: "candle-off.jpg")
    let candleOnImage = UIImage(named: "candle-on.jpg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        candleImageView.image = candleOffImage
        candleLabelStatus.text = "Candle is Off"
        //앱이 시작되자마자 보이는 화면
    }
    
    @IBAction func toggleCandle(_ sender: UISwitch) {
        if sender.isOn {
            candleImageView.image = candleOnImage
            candleLabelStatus.text = "Candle is On"
        }
        else {
            candleImageView.image = candleOffImage
            candleLabelStatus.text = "Candle is Off"
        }
    }
    

}

