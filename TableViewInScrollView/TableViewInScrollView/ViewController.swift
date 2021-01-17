//
//  ViewController.swift
//  TableViewInScrollView
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tbl_View: UITableView!
    @IBOutlet var tbl_height: NSLayoutConstraint!
    @IBOutlet var scl_View: UIScrollView!
    @IBOutlet var menubar: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tbl_View.addObserver(self, forKeyPath: "contentSize", options: .new, context:  nil)
        self.tbl_View.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tbl_View.removeObserver(self, forKeyPath: "contentSize")
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize" {
         
                if let newvalue = change?[.newKey]{
                    let newsize = newvalue as! CGSize
                    self.tbl_height.constant = newsize.height
                }
            
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as? TestCell {
            
            cell.testLabel.text = "Test test test \(indexPath.row)"
            return cell
        }
        return UITableViewCell()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        if scrollView.contentOffset.y > 390 {
            print("hi")
            menubar.frame = .zero
            
        }
    }
    
    
}


