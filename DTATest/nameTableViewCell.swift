//
//  nameTableViewCell.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/23/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

class nameTableViewCell: UITableViewCell {
@IBOutlet weak var label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(text: String) {
        label.text = text
    }
}
