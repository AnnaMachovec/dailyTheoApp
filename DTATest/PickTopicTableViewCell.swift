//
//  PickTopicTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 10/16/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//


//PickTopicableViewCell class constructs what cells will contain in the table view of the Controller
import UIKit

class PickTopicTableViewCell: UITableViewCell {
    @IBOutlet var topicquotelabel: UILabel!
    //each cell contains a label - "topic name"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureCell(text: String) {
        topicquotelabel.text = text
    }
}
