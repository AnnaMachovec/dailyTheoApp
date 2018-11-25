//
//  ChooseViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/21/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//ChooseViewController is a menu where you can search by a theologian or a topic
class ChooseViewController: UIViewController {
    @IBOutlet var topImage: UIImageView!
    @IBOutlet var bottomImage: UIImageView!
    @IBOutlet var searchlabel: UILabel!
    @IBOutlet var bylabel: UILabel!
    @IBOutlet var searchbyTheoButton: UIButton!
    @IBOutlet var searchbyQuoteButton: UIButton!
    @IBOutlet var searchbyTopicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addBackground(imageName: "biblecoffeecut.jpeg", contentMode: .scaleToFill)
        topImage.image = UIImage(named: "bibletopiccut.jpeg")
        bottomImage.image = UIImage(named: "calvinhead2.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
