//
//  PickTopicViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/25/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

class PickTopicViewController: UIViewController {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet weak var topictextButton:UIButton! //declares a Button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WhoGodIs",
            let destination = segue.destination as? topicViewController
        {
            destination.nameofTopic = topictextButton.currentTitle!
            }
    }


}
