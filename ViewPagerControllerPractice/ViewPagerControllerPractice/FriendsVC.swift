//
//  FriendsVC.swift
//  ViewPagerControllerPractice
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class FriendsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

    @IBOutlet var friendsTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        friendsTV.delegate = self
        friendsTV.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        preferredContentSize = view.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        self.view.layoutIfNeeded()
    }
    
    override func viewWillLayoutSubviews() {
        self.view.layoutIfNeeded()
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.contentOffset.y >= 359.0 {
            friendsTV.isScrollEnabled = true
            
           
        }
        
        else {
            friendsTV.isScrollEnabled = false
        }
    }

}
