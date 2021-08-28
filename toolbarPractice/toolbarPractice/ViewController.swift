//
//  ViewController.swift
//  toolbarPractice
//
//  Created by 황지은 on 2021/08/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var toolbar: UIView!
    
    override func viewDidLoad() {
        scrollView.delegate = self
//        self.view.addSubview(toolbar)
//        toolbar.backgroundColor = .black
//        toolbar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
//        toolbar.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        toolbar.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 0).isActive = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
extension ViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            toolbar.isHidden = false
            }
            else {
                toolbar.isHidden = true
            }
        
        if scrollView.contentOffset.y > 0 {
            toolbar.isHidden = false
        }
        else {
            toolbar.isHidden = true
        }
        
    }
    
}

