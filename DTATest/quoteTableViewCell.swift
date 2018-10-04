//
//  quoteTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 9/11/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import Foundation
import UIKit

/*
 This swift class creates a Table View Cell Object for my quoteViewController. Each cell contains a text view controller. Their constraints to how big or small they can get is set in the Main.StoryBoard
 */
class quoteTableViewCell: UITableViewCell {
  @IBOutlet var quoteTextView: UITextView! //declares an outlet for my text (quote) to be included in a table view cell
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

    func configureCell(text: String) {
        quoteTextView.text = text
    }
}
