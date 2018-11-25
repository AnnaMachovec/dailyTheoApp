//
//  AboutViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 10/6/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//AboutViewController class is an about page as to why I did this application
class AboutViewController: UIViewController{
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var whatisLabel: UILabel!
    @IBOutlet var dailytheoLabel: UILabel!
    @IBOutlet var aboutTextView: UITextView!
    @IBOutlet var aboutTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "pew.jpg", contentMode: .scaleToFill)
        
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
