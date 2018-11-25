//
//  quoteViewController.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/28/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//
//172.23.22.14/MAMP/tmp/php/mysqlconnet.php
import UIKit
import CoreData


 //The focus of this class is to display view of quotes for the selected Theologian from previous controller (nameViewController)


class quoteViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    @IBOutlet var quoteTableView: UITableView! //declares a Table View that will hold my quotes in it
    @IBOutlet weak var ftextLabel:UILabel? //declares a Label that will hold first name of Theologian
    @IBOutlet weak var ltextLabel:UILabel? //declares a Label that will hold last name of Theologian
    @IBOutlet weak var quoteSearchBar: UISearchBar! // declares the search bar
    
    
    
    //object array of quotes
    var nameofTheologian:String = "" //stores name of Theologian
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    var fname = ""
    var lname = ""
    var isSearching = false
    var dailyObjectList = [dailyTheoObject]()
    //coredata
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "pew.jpg", contentMode: .scaleToFill)
        process()
        self.quoteTableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
        quoteSearchBar.barTintColor = .clear
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //depending on if a user is searching or not, the table view will updated
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return currentList.count
        }
        
        return  listOfQuotes.count
    }
    
    //depending on if a user is searching or not, table will be a specific list
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
   
    //displays list of cells that match the users search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            quoteTableView.reloadData()
        } else{
            isSearching = true
            currentList = listOfQuotes.filter({$0.localizedCaseInsensitiveContains(searchBar.text!)})
            quoteTableView.reloadData()
        }
    }
    
    //makes an DailyTheo Object array of the quotes
    func makeQuoteArray(whichtext: String){
            listOfQuotes = []
            for i in dailyObjectList{
                if i.theoname == whichtext{
                    listOfQuotes.append(i.theoquote)
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
    
    //func process is a function that creates objects by parsing data from the AllQuotes.txt file
    func process(){
       
      //process func still
        let bundle = Bundle.main
        let newpath = bundle.path(forResource: "AllQuotes", ofType: "txt")
        let filemgr = FileManager.default
        if filemgr.fileExists(atPath: newpath!){
            do {
                let fulltext = try String(contentsOfFile: newpath!, encoding: String.Encoding.utf8)
                let readings = fulltext.components(separatedBy: "\n")
                for i in readings{
                    let clientdata = i.components(separatedBy: ":")
                    if !(clientdata[0].isEmpty){
                        var tempbool = false
                        if clientdata[3]=="true"{
                            tempbool = true
                        }
                        let temp = dailyTheoObject(name: clientdata[0], quote: clientdata[1], favorited: tempbool, nametopic: clientdata[2])
                        dailyObjectList.append(temp)
                        
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
        
    }//process func
    
   

}
