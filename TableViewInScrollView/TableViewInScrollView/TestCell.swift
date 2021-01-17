//
//  TestCell.swift
//  TableViewInScrollView
//
//  Created by 황지은 on 2021/01/06.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet var testLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
