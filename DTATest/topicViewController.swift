//
//  topicViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/21/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

class topicViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var quoteTableView: UITableView! //declares a Table View that will hold my quotes in it
    @IBOutlet weak var topictextLabel:UILabel? //declares a Label that will hold name of Theologian
    @IBOutlet weak var quoteSearchBar: UISearchBar!
    
    var dailyObjectList = [dailyTheoObject]()
    
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    var isSearching = false
    var nameofTopic:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground(imageName: "pew.jpg", contentMode: .scaleToFill)
        process()
        quoteTableView.backgroundColor = UIColor.clear
        self.topictextLabel?.text = nameofTopic
        makeQuoteArray(whichtext: nameofTopic)
        self.quoteTableView.rowHeight = UITableViewAutomaticDimension;
        self.quoteTableView.estimatedRowHeight = 50;
        self.quoteTableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return currentList.count
        }
        return  listOfQuotes.count
    }//tableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let quotecell = tableView.dequeueReusableCell(withIdentifier: "topicquotecell", for: indexPath) as? topicTableViewCell{
            let text: String!
            if isSearching{
                text = currentList[indexPath.item]
            }
            else{
                text = listOfQuotes[indexPath.item]
            }
            var temp: String!
            for i in dailyObjectList{
                if i.theoquote == text{
                    temp = "- " + i.theoname
                }
            }
            quotecell.configureCell(text: text, nametheo: temp)
            //quotecell.backgroundColor = UIColor.clear
            return quotecell
        }
        else{
            return UITableViewCell()
        }
    }//tableView
    
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
    }//searchBar
    
    func makeQuoteArray(whichtext: String){
        listOfQuotes = []
        for i in dailyObjectList{
            let topiclist = i.topic
            if topiclist.range(of: nameofTopic) != nil{
                listOfQuotes.append(i.theoquote)
            }
        }
    }//makeQuoteArray
    
    func process(){
        
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
                        print(clientdata[2])
                        dailyObjectList.append(temp)
                        
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
    }//process
    
      
  

}
