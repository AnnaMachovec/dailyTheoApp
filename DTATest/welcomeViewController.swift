//
//  ViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/4/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//


import UIKit
import Foundation
import CoreData



//this class creates the opening page of the Daily Theo App
//there is a main menu selection (Table View) and the title of the app

class welcomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet var welcometableView: UITableView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    var dailyObjectList = [dailyTheoObject]()
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        //view.addBackground()
        welcometableView.backgroundColor = .clear
        self.welcometableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //fucntion allows rows to be deselected in welcomeTableView
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.welcometableView.indexPathForSelectedRow{
            self.welcometableView.deselectRow(at: IP, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }//tableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
    
    //function creates each menu option in the Welcome Table View to be unique with a title and image
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quotecell = tableView.dequeueReusableCell(withIdentifier: "homecell", for: indexPath) as? welcomeTableViewCell
        if indexPath.row == 0{
            quotecell?.configureCell(imageone: "treelife.png", label: "Random Quote")
        }
        if indexPath.row == 1{
            quotecell?.configureCell(imageone: "coffeebible.JPG", label: "Quotes")
        }
        if indexPath.row == 2{
            quotecell?.configureCell(imageone: "pewcut.jpeg", label: "About")
        }
        
        quotecell?.backgroundColor = .clear
        return quotecell!
    }//tableView
    
    //function perfomrs different segues to different pages depending on the row on selected cell in GeneralTableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0{
        self.performSegue(withIdentifier: "dailysegue", sender: self)
    }
    if indexPath.row == 1{
        self.performSegue(withIdentifier: "segue", sender: self)
    }
    if indexPath.row == 2{
        self.performSegue(withIdentifier: "segue2", sender: self)
    }
    
    }
    
    
    //function is suppose to allow a label to fade in but i dont believe it acutally works :/
    func fadeViewIn(view : UILabel, delay: TimeInterval) {
        
        let animationDuration = 0.25
        
        // Fade in the view
        UIView.animate(withDuration: animationDuration, animations: { () -> Void in
            view.alpha = 1
        }) { (Bool) -> Void in
            
        }
    }
    
}


