//
//  AboutTableViewCell.swift
//  DTATest
//
//  Created by Anna Machovec on 10/6/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//



import UIKit

//welcomeTableViewCell class constructs what cells will contain in the table view of the welcomeViewController
class welcomeTableViewCell: UITableViewCell {
    
//Each cell will contain both a label and an image
    @IBOutlet var cellimage: UIImageView!
    @IBOutlet var celllabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //configureCell function configures the image and label to what the programmer wants it to be
    func configureCell(imageone: String ,label: String) {
        cellimage.image = UIImage(named: imageone)
        celllabel.text = label
    }
}
