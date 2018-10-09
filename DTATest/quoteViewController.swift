//
//  quoteViewController.swift
//  Prototype1
//
//  Created by Anna Machovec on 8/28/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit
import CoreData


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
    var dailyObjectList = [dailyTheoObject]()
    //coredata
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        process()
        
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
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    //FAVORITES
    
    //FAVORITES
    
    
 
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
                        let temp = dailyTheoObject(name: clientdata[0], quote: clientdata[1], favorited: tempbool)
                        dailyObjectList.append(temp)
                        
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
        
    }//process func
    
    //**************************************************
  /*
    func tableView(_ tableView: UITableView,
                            editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { (action, indexPath) in
            var favorites : [String] = []
            let defaults = UserDefaults.standard
            if let favoritesDefaults : AnyObject? = defaults.object(forKey: "favorites") as AnyObject {
                favorites = favoritesDefaults! as! [String]
            }
            
            favorites.append((tableView.cellForRow(at: indexPath)?.textLabel!.text!)!)
            defaults.set(favorites, forKey: "favorites")
            defaults.synchronize()
        }
        
        favorite.backgroundColor = UIColor.green
        
        return [favorite]
    }
    */
    /*
    //write over text file here
    func changeFavoriteToTrue(dteobject: dailyTheoObject){
        dteobject.favorited = true
        
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
                        if clientdata[1]==dteobject.theoquote{
                            let replaced = clientdata[3].replacingOccurrences(of: "false", with: "true")
                        }
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
        
    }
    func changeFavoriteToFalse(dteobject: dailyTheoObject){
        dteobject.favorited = false
        
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
                        if clientdata[1]==dteobject.theoquote{
                            i.replacingOccurrences(of: "true", with: "false")
                            
                        }
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
        
        
    }
    
   */

}
