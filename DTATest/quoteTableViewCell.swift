//
//  quoteTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 9/11/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import Foundation
import UIKit

///quoteTableViewCell class constructs what cells will contain in the table view of the quoteiewController

class quoteTableViewCell: UITableViewCell {
@IBOutlet var quoteTextView: UITextView! //declares an outlet for my text (quote) to be included in a table view cell
@IBOutlet var clearlabel: UILabel!
   
//each cell contains a text view that displays a quote
    
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
