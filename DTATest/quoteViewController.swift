//
//  quoteViewController.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/28/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit


class quoteViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet var quoteTableView: UITableView! //declares a Table View that will hold my quotes in it
    @IBOutlet weak var ftextLabel:UILabel? //declares a Label that will hold name of Theologian
    @IBOutlet weak var ltextLabel:UILabel?
    @IBOutlet weak var quoteSearchBar: UISearchBar!
    
    //object array of quotes
    var nameofTheologian:String = "" //stores name of Theologian
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    var fname = ""
    var lname = ""
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        quoteTableView.backgroundColor = UIColor.clear
        seperateName(name: nameofTheologian)
        self.ftextLabel?.text = fname
        self.ltextLabel?.text = lname
        makeQuoteArray(whichtext: nameofTheologian)
        self.quoteTableView.rowHeight = UITableViewAutomaticDimension;
        self.quoteTableView.estimatedRowHeight = 50;
        quoteTableView.delegate = self
        quoteTableView.dataSource = self
        quoteSearchBar.delegate = self
        quoteSearchBar.returnKeyType = UIReturnKeyType.done
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return currentList.count
        }
        
        return  listOfQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let quotecell = tableView.dequeueReusableCell(withIdentifier: "quotecell", for: indexPath) as? quoteTableViewCell{
            let text: String!
            if isSearching{
                text = currentList[indexPath.item]
            }
            else{
                text = listOfQuotes[indexPath.item]
            }
            quotecell.configureCell(text: text)
            quotecell.backgroundColor = UIColor.clear
            return quotecell
        }
        else{
            return UITableViewCell()
        }
       
    }
   
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            quoteTableView.reloadData()
        } else{
            isSearching = true
            currentList = listOfQuotes.filter({$0.contains(searchBar.text!)})
            quoteTableView.reloadData()
        }
    }
    
    
    
    
    
    
    
   

    func makeQuoteArray(whichtext: String){
        if whichtext == "Charles Spurgeon"{
            listOfQuotes = []
           
               
        }
        if whichtext=="Saint Augustine"{
            listOfQuotes = []
            let bundle = Bundle.main
            let newpath = bundle.path(forResource: "SaintAugustine", ofType: "txt")
            let filemgr = FileManager.default
            if filemgr.fileExists(atPath: newpath!){
                do {
                    let fulltext = try String(contentsOfFile: newpath!, encoding: String.Encoding.utf8)
                    let readings = fulltext.components(separatedBy: "\n")
                    for i in readings{
                        let clientdata = i.components(separatedBy: "\t")
                        listOfQuotes.append(clientdata[0])
                    }
                }catch let error as NSError {
                    print(error)
                }
            }
        }
        if whichtext=="John Owen"{
            listOfQuotes = []
            let bundle = Bundle.main
            let newpath = bundle.path(forResource: "JohnOwen", ofType: "txt")
            let filemgr = FileManager.default
            if filemgr.fileExists(atPath: newpath!){
                do {
                    let fulltext = try String(contentsOfFile: newpath!, encoding: String.Encoding.utf8)
                    let readings = fulltext.components(separatedBy: "\n")
                    for i in readings{
                        let clientdata = i.components(separatedBy: "\t")
                        listOfQuotes.append(clientdata[0])
                    }
                }catch let error as NSError {
                    print(error)
                }
            }
        }
    }
    
    func seperateName(name: String){
        var components = name.components(separatedBy: " ")
        if(components.count > 0)
        {
            fname = components.removeFirst()
            lname = components.joined(separator: " ")
            
        }
    }
    
    
    //**************************************************
  

}
