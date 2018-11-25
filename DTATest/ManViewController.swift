//
//  PickTopicViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/25/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//ManViewController class shows all the topics after a user selects "Man" from the GeneralTopicViewController menu
class ManViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var backgroundImage: UIImageView!
     @IBOutlet var ManTableView: UITableView!
    @IBOutlet var SecondTableView: UITableView!
    @IBOutlet var thirdTableView: UITableView!
    
    @IBOutlet var labelone: UILabel!
    @IBOutlet var labeltwo: UILabel!
    @IBOutlet var labelthree: UILabel!
    @IBOutlet var Manlabel: UILabel!
    
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    
    //arrays of topics are made
    var fruitsSpirit: [String] = ["Love","Joy","Peace","Prayer","Obedience", "Gratitude","Perseverance","Holiness"]
    var theFlesh: [String] = ["Anxiety", "Worry", "Depravity", "Temptation", "Lust"]
    var willingObedience: [String] = ["Liberty", "Thoughts", "Speaking Up", "Obedience", "Praise", "Sexual Purity"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "handsupcut.jpeg", contentMode: .scaleToFill)
        ManTableView.backgroundColor = UIColor.clear
        self.ManTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        SecondTableView.backgroundColor = UIColor.clear
        self.SecondTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        thirdTableView.backgroundColor = UIColor.clear
        self.thirdTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.ManTableView.indexPathForSelectedRow{
            self.ManTableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.SecondTableView.indexPathForSelectedRow{
            self.SecondTableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.thirdTableView.indexPathForSelectedRow{
            self.thirdTableView.deselectRow(at: IP, animated: true)
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var numberoflines = 0
        if tableView == self.ManTableView{
            numberoflines = fruitsSpirit.count
        }
        if tableView == self.SecondTableView{
            numberoflines = theFlesh.count
        }
        if tableView == self.thirdTableView{
            numberoflines = willingObedience.count
        }
       
        
        return  numberoflines
    }
    
    //since this class uses two table views they are configured seperately
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        var topiccell:PickTopicTableViewCell?
        
        if tableView == self.ManTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "topiccell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = fruitsSpirit[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        
        if tableView == self.SecondTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "actioncell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = theFlesh[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        if tableView == self.thirdTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "obediencecell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = willingObedience[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
       
        
        return topiccell!
    }
    
    //depending on topic selected, a segue will take them to a new destination
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue",
            let destination = segue.destination as? topicViewController,
            let IP = ManTableView.indexPathForSelectedRow?.row
        {
         destination.nameofTopic = fruitsSpirit[IP]
        }
        if segue.identifier == "segue2",
            let destination = segue.destination as? topicViewController,
            let IP = SecondTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = theFlesh[IP]
        }
        if segue.identifier == "segue3",
            let destination = segue.destination as? topicViewController,
            let IP = thirdTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = willingObedience[IP]
        }
       
    }


}
