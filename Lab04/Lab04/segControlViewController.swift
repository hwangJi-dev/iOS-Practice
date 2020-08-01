//
//  segControlViewController.swift
//  Lab04
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class segControlViewController: UIViewController {
    
    @IBOutlet var leftRightSegControl: UISegmentedControl!
    @IBOutlet var displayLabel: UILabel!
    var selectedSegmentIndex_segControlview:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var makeString = leftRightSegControl.titleForSegment(at: selectedSegmentIndex_segControlview)!
        
        displayLabel.text = makeString + " 선택됨"
        leftRightSegControl.selectedSegmentIndex = selectedSegmentIndex_segControlview
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
