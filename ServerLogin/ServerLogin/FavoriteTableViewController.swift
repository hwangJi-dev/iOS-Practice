//
//  FavoriteTableViewController.swift
//  ServerLogin
//
//  Created by 황지은 on 2020/06/01.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {

    //fetchedArray는 서버쪽에서 가져온 데이터를 저장하는 FavoriteData형 배열임
    var fetchedArray: [FavoriteData] = Array()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchedArray = [] //배열을 초기화하고 서버에서 자료를 다시 가져옴
        self.downloadDataFromServer()
    }
    
    func downloadDataFromServer() ->Void {
        
        let urlString: String = "http://condi.swu.ac.kr/student/favorite/favoriteTable.php"
        guard let requestURL = URL(string: urlString) else { return }
        let request = URLRequest(url: requestURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            guard responseError == nil else { print("Error: calling POST"); return; }
            guard let receivedData = responseData else {
                print("Error: not receiving Data"); return;
            }
            let response = response as! HTTPURLResponse
            
        if !(200...299 ~= response.statusCode) { print("HTTP response Error!"); return }
        do {
        if let jsonData = try JSONSerialization.jsonObject (with: receivedData,
        options:.allowFragments) as? [[String: Any]] {
        for i in 0...jsonData.count-1 {
        var newData: FavoriteData = FavoriteData()
        var jsonElement = jsonData[i]
        newData.favoriteno = jsonElement["favoriteno"] as! String
        newData.userid = jsonElement["id"] as! String
        newData.name = jsonElement["name"] as! String //제목
        newData.descript = jsonElement["description"] as! String
        newData.imageName = jsonElement["imageName"] as! String
        newData.date = jsonElement["date"] as! String //날짜
        self.fetchedArray.append(newData)
        }
        DispatchQueue.main.async { self.tableView.reloadData() }
        }
        } catch { print("Error: Catch") }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if let name = appDelegate.userName {
            self.title = name + "'s Favorite"
        }
        
        
    
        
    }
    @IBAction func buttonLogout(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "로그아웃 하시겠습니까?", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            let urlString:String = "http://condi.swu.ac.kr/student/login/logout.php"
            guard let requestURL = URL(string: urlString) else {return}
            var request = URLRequest(url: requestURL)
            request.httpMethod = "POST"
            let session = URLSession.shared
            let task = session.dataTask(with: request) {(
                responseData, response, responseError) in
                guard responseError == nil else {return}
            }
            task.resume()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginView = storyboard.instantiateViewController(withIdentifier: "loginView")
            loginView.modalPresentationStyle = .fullScreen
            self.present(loginView, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert,animated: true)
    
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite Cell", for: indexPath)

        // Configure the cell...
        let item = fetchedArray[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.date

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "toDetailView" {
            if let destination = segue.destination as? DetailViewController {
                if let selectedIndex = self.tableView.indexPathsForSelectedRows?.first?.row {
                    let data = fetchedArray[selectedIndex]
                    destination.selectedData = data
                    destination.title = data.name
                }
            }
        }
    }
    

}
