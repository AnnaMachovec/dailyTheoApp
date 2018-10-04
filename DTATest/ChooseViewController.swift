//
//  ChooseViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/21/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var searchbyTheoButton: UIButton!
    @IBOutlet var searchbyQuoteButton: UIButton!
    @IBOutlet var searchbyTopicButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
