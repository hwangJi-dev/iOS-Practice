//
//  SaveViewController.swift
//  FriendsInfo
//
//  Created by 황지은 on 2020/05/24.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController {

    @IBOutlet var textName: UITextField!
    @IBOutlet var textPhone: UITextField!
    @IBOutlet var textMemo: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Friends", in: context)
        
        //friend record를 새로 생성함
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textName.text, forKey: "name")
        object.setValue(textPhone.text, forKey: "phone")
        object.setValue(textMemo.text, forKey: "memo")
        object.setValue(Date(), forKey: "saveDate")
        
        do{
            try context.save()
            print("saved!")
        }catch let error as NSError {
            print("should not save \(error), \(error.userInfo)")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
