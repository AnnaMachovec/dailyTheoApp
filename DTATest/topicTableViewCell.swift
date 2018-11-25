//
//  topicTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 9/25/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//
import Foundation
import UIKit


//topicTableViewCell class constructs what cells will contain in the table view of the topicViewController

class topicTableViewCell: UITableViewCell {
    @IBOutlet var topicquoteTextView: UITextView! //declares an outlet for my text (quote) to be included in a table view cell
    @IBOutlet var name: UILabel!
    
    //these cells contain both a text view and a label contianing the quote and name of theologian
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //let dropButton = UIButton(type: .system)
        //dropButton.setImage(#imageLiteral(resourceName: "threedots"), for: .normal)
        //dropButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        //dropButton.tintColor = .white
        //dropButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        
       // accessoryView = dropButton
    }
  

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(text: String, nametheo: String) {
        topicquoteTextView.text = text
        name.text = nametheo
    }
}
