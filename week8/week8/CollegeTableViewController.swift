//
//  CollegeTableViewController.swift
//  week8
//
//  Created by 황지은 on 2020/05/17.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class CollegeTableViewController: UITableViewController {

    var university:[String: [String]] = ["미래산업융합대학" : ["디지털미디어학과","소프트웨어융합학과","정보보호학과","패션디자인학과","산업디자인학과","경영학과"],"사회과학대학":["경제학과","문헌정보학과","사회복지학과","아동학과","행정학과","언론영상학부","교육심리학과","체육학과"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "서울여자대학교"
        
        //edit buttonItem
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDeptView" {
            if let destination = segue.destination as? DeptTableViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    destination.title = Array(university.keys)[selectedIndex]
                    destination.departmentList = Array(university.values)[selectedIndex]
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return university.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "College Cell", for: indexPath)

        // Configure the cell...
        let collegeName = Array(university.keys)
        cell.textLabel?.text = collegeName[indexPath.row]

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let collegeName = Array(university.keys)[indexPath.row]
            self.university.removeValue(forKey: collegeName)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
