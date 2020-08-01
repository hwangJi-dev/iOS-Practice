//
//  CollectionViewCell.swift
//  menubarCollectionView
//
//  Created by 황지은 on 2020/06/06.
//  Copyright © 2020 황지은. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    class var reuseIdentifier:String {
        return "CollectionViewCellReuseIdentifier"
    }

    class var nibName: String {
        return "CollectionViewCell"
    }
    
    func configureCell(name:String){
        self.nameLabel.text = name
    }

}

