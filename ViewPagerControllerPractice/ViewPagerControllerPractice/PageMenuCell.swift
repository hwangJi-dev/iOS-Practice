//
//  PageMenuCell.swift
//  ViewPagerControllerPractice
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class PageMenuCell: UICollectionViewCell {
    
    @IBOutlet var menuLabel: UILabel!
    @IBOutlet var menuUnderBar: UIView!
    
    var collectionView: UICollectionView?
    
    override var isHighlighted: Bool {
        didSet {
            menuLabel.font = isSelected ? .boldSystemFont(ofSize: 17) : .boldSystemFont(ofSize: 15)
            
            UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
                self.menuUnderBar.layoutIfNeeded()
                self.menuUnderBar.alpha = self.isSelected ? 1 : 0
            }, completion: nil)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            menuLabel.font = isSelected ? .boldSystemFont(ofSize: 17) : .boldSystemFont(ofSize: 15)
            
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.menuUnderBar.layoutIfNeeded()
                self.menuUnderBar.alpha = self.isSelected ? 1 : 0
            }, completion: nil)
        }
    }
}
