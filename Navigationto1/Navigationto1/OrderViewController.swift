//
//  OrderViewController.swift
//  Navigationto1
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    
    @IBOutlet var infoLabel: UILabel!
    var info:String? //첫번째 화면에서 정보를 받아올 변수
    //?을 주게 되면 null일 수도 있기 때문에 초기값을 안줘도 된다.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let contentString = info {
            infoLabel.text = contentString
        }
    }
    

            //var info:String! = ""
            //  override func viewDidLoad() {
                     //super.viewDidLoad()
//
                 // infoLabel.text = info
            //  }
            
    
    
    /* // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
