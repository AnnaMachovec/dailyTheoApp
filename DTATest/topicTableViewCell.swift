//
//  topicTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 9/25/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//
import Foundation
import UIKit

class topicTableViewCell: UITableViewCell {
    @IBOutlet var topicquoteTextView: UITextView! //declares an outlet for my text (quote) to be included in a table view cell
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(text: String) {
        topicquoteTextView.text = text
    }
}
