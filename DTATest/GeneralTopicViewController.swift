//
//  GeneralTopicViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 10/18/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit


//GeneralTopicViewController class gives a menu of three different opics to choose from: God,Man,Community
class GeneralTopicViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var GeneralTopicView: UITableView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var toplabel: UILabel!
    
    var dailyObjectList = [dailyTheoObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GeneralTopicView.backgroundColor = .clear
        self.GeneralTopicView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.GeneralTopicView.indexPathForSelectedRow{
            self.GeneralTopicView.deselectRow(at: IP, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }//tableView
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }
    
    //configures text and images for each cell in the table view menu
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quotecell = tableView.dequeueReusableCell(withIdentifier: "generaltopiccell", for: indexPath) as? GeneralTopicsTableViewCell
        if indexPath.row == 0{
            quotecell?.configureCell(imageone: "lionshort.JPG", label: "God")
        }
        if indexPath.row == 1{
            quotecell?.configureCell(imageone: "handsup.JPG", label: "Man")
        }
        if indexPath.row == 2{
            quotecell?.configureCell(imageone: "worship.JPG", label: "Community")
        }
        quotecell?.backgroundColor = .clear
        return quotecell!
    }//tableView
    
    //performs a specific segue depending on which cell in table view is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            self.performSegue(withIdentifier: "Godsegue", sender: self)
        }
        if indexPath.row == 1{
            self.performSegue(withIdentifier: "mansegue", sender: self)
        }
        if indexPath.row == 2{
            self.performSegue(withIdentifier: "communitysegue", sender: self)
        }
        
    }
    
}
