//
//  SaveViewController.swift
//  Lab09
//
//  Created by 황지은 on 2020/05/24.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var ideaName: UITextField!
    @IBOutlet var ideaContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    func getContext() ->NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
        let context = self.getContext()
               let entity = NSEntityDescription.entity(forEntityName: "Idea", in: context)
               
               //friend record를 새로 생성함
               let object = NSManagedObject(entity: entity!, insertInto: context)
               
               object.setValue(ideaName.text, forKey: "ideaTitle")
               object.setValue(ideaContent.text, forKey: "ideaContent")
               object.setValue(Date(), forKey: "ideaDate")
               
               do{
                   try context.save()
                   print("saved!")
               }catch let error as NSError {
                   print("should not save \(error), \(error.userInfo)")
               }
               
               self.navigationController?.popViewController(animated: true)
               
           }

}
