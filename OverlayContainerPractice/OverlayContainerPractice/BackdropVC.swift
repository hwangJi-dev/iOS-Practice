//
//  BackdropVC.swift
//  OverlayContainerPractice
//
//  Created by 황지은 on 2021/01/01.
//

import OverlayContainer
import UIKit

class BackdropVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = PassThroughView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.85)

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
