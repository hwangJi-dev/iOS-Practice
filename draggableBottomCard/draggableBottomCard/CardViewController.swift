//
//  CardViewController.swift
//  draggableBottomCard
//
//  Created by 황지은 on 2020/12/23.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var handleArea: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleArea.layer.cornerRadius = 20
        handleArea.clipsToBounds = true
        handleArea.layer.maskedCorners = [.layerMaxXMinYCorner , .layerMinXMinYCorner]

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
