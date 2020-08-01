//
//  DetailViewController.swift
//  FriendsInfo
//
//  Created by 황지은 on 2020/05/24.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    @IBOutlet var saveDate: UITextField!
    
    var detailFriend:NSManagedObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let friend = detailFriend{
            textName.text = friend.value(forKey: "name")as? String
            textPhone.text = friend.value(forKey: "phone")as? String
            textMemo.text = friend.value(forKey: "memo")as? String
            let dbDate:Date? = friend.value(forKey: "saveDate")as? Date
            
            let formatter:DateFormatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd h:mm a"
            if let unwrapDate = dbDate{
                saveDate.text = formatter.string(from: unwrapDate as Date)
            }
        }
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
