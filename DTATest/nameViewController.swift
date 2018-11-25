//home view controller

//
//  homeViewController.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/23/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//nameViewController is where the names of all theologians can be accessed to search through and click on to view quotes
class nameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet var backgroundImage2: UIImageView!
    @IBOutlet weak var namesTableView: UITableView!
    @IBOutlet weak var theoSearchBar: UISearchBar!

    var isSearching = false
    var theoQuotes = ""
    
    //lists we search through
    var listofNames: [String] = ["Charles Spurgeon", "Saint Augustine","John Owen","John MacArthur", "Martin Luther", "John Piper","John Calvin", "John Wycliffe", "JC Ryle", "AW Tozer", "AW Pink", "Dietrich Bonhoeffer","Voddie Baucham", "John Knox","James White", "RC Sproul","Matt Chandler"]
    var currentList: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "pew.jpg", contentMode: .scaleToFill)
        namesTableView.backgroundColor = UIColor.clear
        namesTableView.delegate = self
        namesTableView.dataSource = self
        theoSearchBar.delegate = self
        theoSearchBar.returnKeyType = UIReturnKeyType.done
        theoSearchBar.barTintColor = .clear
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return currentList.count
        }
        
        return  listofNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let namecell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as? nameTableViewCell{
            let text: String!
            if isSearching{
                text = currentList[indexPath.item]
            }
            else{
                text = listofNames[indexPath.item]
            }
            namecell.configureCell(text: text)
            namecell.backgroundColor = UIColor.clear
            return namecell
        }
        else{
            return UITableViewCell()
        }
        
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let IP = self.namesTableView.indexPathForSelectedRow{
            self.namesTableView.deselectRow(at: IP, animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue",
            let destination = segue.destination as? quoteViewController,
            let IP = namesTableView.indexPathForSelectedRow?.row
        {
            if isSearching{
                print(currentList[IP])
                destination.nameofTheologian = currentList[IP]
            }
            else{
                print(listofNames[IP])
                destination.nameofTheologian = listofNames[IP]
            }
            
        }
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            namesTableView.reloadData()
        } else{
            isSearching = true
            currentList = listofNames.filter({$0.contains(searchBar.text!)})
            namesTableView.reloadData()
        }
    }
    
    
    
}


