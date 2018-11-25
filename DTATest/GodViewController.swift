//
//  GodViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 10/19/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//GodViewController class shows all the topics after a user selects "God" from the GeneralTopicViewController menu
class GodViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var ATableView: UITableView!
    @IBOutlet var Alabel: UILabel!
    @IBOutlet var JesusTableView: UITableView!
    @IBOutlet var Jesuslabel: UILabel!
    @IBOutlet var WorksTableView: UITableView!
    @IBOutlet var Workslabel: UILabel!
    @IBOutlet var Godlabel: UILabel!
    
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    //array making the list of topics
    var listofAttributes: [String] = ["Sovereignty", "Grace", "Trinity", "Eternality"]
    var listofJesus: [String] = ["Sufficiency of Christ", "Worthy"]
    var listofWorks: [String] = ["Creation","Hell","Heaven"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "lionlong.jpeg", contentMode: .scaleToFill)
        ATableView.backgroundColor = UIColor.clear
        self.JesusTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        JesusTableView.backgroundColor = UIColor.clear
        self.ATableView.separatorStyle = UITableViewCellSeparatorStyle.none
        WorksTableView.backgroundColor = UIColor.clear
        self.WorksTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.ATableView.indexPathForSelectedRow{
            self.ATableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.JesusTableView.indexPathForSelectedRow{
            self.JesusTableView.deselectRow(at: IP, animated: true)
        }
        if let IP = self.WorksTableView.indexPathForSelectedRow{
            self.WorksTableView.deselectRow(at: IP, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberoflines = 0
        if tableView == self.ATableView{
            numberoflines = listofAttributes.count
        }
        if tableView == self.JesusTableView{
            numberoflines = listofJesus.count
        }
        if tableView == self.WorksTableView{
            numberoflines = listofWorks.count
        }
        
        
        return  numberoflines
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var topiccell:PickTopicTableViewCell?
        
        if tableView == self.ATableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "acell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofAttributes[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        
        if tableView == self.JesusTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "Jesuscell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofJesus[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        if tableView == self.WorksTableView{
            topiccell = tableView.dequeueReusableCell(withIdentifier: "workscell", for: indexPath) as? PickTopicTableViewCell
            let text: String!
            text = listofWorks[indexPath.item]
            topiccell?.configureCell(text: text)
            topiccell?.backgroundColor = UIColor.clear
        }
        
        
        return topiccell!
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1",
            let destination = segue.destination as? topicViewController,
            let IP = ATableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofAttributes[IP]
        }
        if segue.identifier == "segue2",
            let destination = segue.destination as? topicViewController,
            let IP = JesusTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofJesus[IP]
        }
        if segue.identifier == "segue3",
            let destination = segue.destination as? topicViewController,
            let IP = WorksTableView.indexPathForSelectedRow?.row
        {
            destination.nameofTopic = listofWorks[IP]
        }
    }


}
