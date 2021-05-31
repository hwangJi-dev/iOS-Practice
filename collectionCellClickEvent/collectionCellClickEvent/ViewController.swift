//
//  ViewController.swift
//  collectionCellClickEvent
//
//  Created by 황지은 on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTV.delegate = self
        mainTV.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
