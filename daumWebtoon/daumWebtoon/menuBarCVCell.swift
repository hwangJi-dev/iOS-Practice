//
//  menuBarCVCell.swift
//  daumWebtoon
//
//  Created by 황지은 on 2020/08/24.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class menuBarCVCell: UICollectionViewCell {
    
    @IBOutlet var menuBarLabel: UILabel!
    
    
    override func awakeFromNib() {
        menuBarLabel.alpha = 0.5
    }
    
    override var isSelected: Bool {
      didSet {
        if isSelected {
            print("select")
            menuBarLabel.alpha = 1
        } else {
            menuBarLabel.alpha = 0.5
        }
      }
    }
}
