//
//  ViewController.swift
//  DatePicker
//
//  Created by 황지은 on 2020/04/13.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelInfo: UILabel!
    @IBOutlet var pickerDateTime: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getDateTime() {
        let dateFormatter = DateFormatter()
        
        //.none, .short, .medium, .long, .full
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .medium
        
        self.labelInfo.text = dateFormatter.string(from: self.pickerDateTime.date)
        
    }
    
}

