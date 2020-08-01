//
//  ViewController.swift
//  Navigation
//
//  Created by 황지은 on 2020/04/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        let button = sender as! UIButton
        destination.title = button.titleLabel?.text
    }
}

