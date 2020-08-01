//
//  TagCollectionViewCell.swift
//  tagPractice
//
//  Created by 황지은 on 2020/07/14.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var collectionViewCell: UIView!
    @IBOutlet var tagNameLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backgroundColor = .gray
                tagNameLabel.textColor = .white
            } else {
                backgroundColor = .white
                tagNameLabel.textColor = .gray
            }
        }
    }
    
    func setTag(tagName:String){
        tagNameLabel.text = tagName
    }
    
    
}
