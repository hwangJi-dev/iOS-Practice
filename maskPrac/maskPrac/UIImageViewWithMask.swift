//
//  UIImageViewWithMask.swift
//  maskPrac
//
//  Created by hwangJi on 2022/05/10.
//

import Foundation
import UIKit

@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()

    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }

    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }

    func updateView() {
        if maskImageView.image != nil {
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }
}
