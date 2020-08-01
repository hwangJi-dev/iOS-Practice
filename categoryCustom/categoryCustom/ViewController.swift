//
//  ViewController.swift
//  categoryCustom
//
//  Created by 황지은 on 2020/07/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit
import TTGTagCollectionView

class ViewController: UIViewController,  TTGTextTagCollectionViewDelegate {
    
    
    
   
    let collectionView = TTGTextTagCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.alignment = .left
        view.addSubview(collectionView)
       // my.dataSource = self
        
        let config = TTGTextTagConfig()
        config.backgroundColor = .systemBlue
        config.textColor = .white
        config.borderColor = .systemPink
        config.borderWidth = 1
        collectionView.addTags(["사자","오리"], with: config)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: view.frame.size.height)
    }


}

