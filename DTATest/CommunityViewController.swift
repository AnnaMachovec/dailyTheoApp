//
//  CommunityViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 10/19/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//CommunityViewController class shows all the topics after a user selects "Community" from the GeneralTopicViewController menu
class CommunityViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var ComTableView: UITableView!
    @IBOutlet var Comlabel: UILabel!
    @IBOutlet var relationshipsTableView: UITableView!
    @IBOutlet var relationshipslabel: UILabel!
    @IBOutlet var sufferingTableView: UITableView!
    @IBOutlet var sufferinglabel: UILabel!
    
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    //array holding list of topics
    var listofTopics: [String] = ["Society", "Morality", "Judging", "Discipleship", "Worship"]
     var listofrelationships: [String] = ["Focus", "Confession", "Prayer", "Fellowship"]
    var listofsuffering: [String] = ["Suffering", "Affliction", "Persecution", "Outcast"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "worshipcut.jpeg", contentMode: .scaleToFill)
        ComTableView.backgroundColor = UIColor.clear
        self.ComTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        relationshipsTableView.backgroundColor = UIColor.clear
        self.relationshipsTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        sufferingTableView.backgroundColor = UIColor.clear
        self.sufferingTableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.ComTableView.indexPathForSelectedRow{
            self.ComTableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.relationshipsTableView.indexPathForSelectedRow{
            self.relationshipsTableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.sufferingTableView.indexPathForSelectedRow{
            self.sufferingTableView.deselectRow(at: IP, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberoflines = 0
        if tableView == self.ComTableView{
            numberoflines = listofTopics.count
        }
        if tableView == self.relationshipsTableView{
            numberoflines = listofrelationships.count
        }
        if tableView == self.sufferingTableView{
            numberoflines = listofsuffering.count
        }
        
        
        return  numberoflines
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var topiccell:PickTopicTableViewCell?
        
        if tableView == self.ComTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "churchcell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofTopics[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        
        if tableView == self.relationshipsTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "relationshipscell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofrelationships[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        if tableView == self.sufferingTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "sufferingcell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofsuffering[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        
        
        return topiccell!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1",
            let destination = segue.destination as? topicViewController,
            let IP = ComTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofTopics[IP]
        }
        
        if segue.identifier == "segue2",
            let destination = segue.destination as? topicViewController,
            let IP = relationshipsTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofrelationships[IP]
        }
        
        if segue.identifier == "segue3",
            let destination = segue.destination as? topicViewController,
            let IP = sufferingTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofsuffering[IP]
        }
        
    }

}
