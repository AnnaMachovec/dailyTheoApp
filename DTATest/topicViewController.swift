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
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    var isSearching = false
    var nameofTopic:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addBackground()
        quoteTableView.backgroundColor = UIColor.clear
        self.topictextLabel?.text = nameofTopic
        makeQuoteArray(whichtext: nameofTopic)
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
        if let quotecell = tableView.dequeueReusableCell(withIdentifier: "topicquotecell", for: indexPath) as? topicTableViewCell{
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
        if whichtext == "Who God Is"{
            listOfQuotes = []
            let bundle = Bundle.main
            let newpath = bundle.path(forResource: "WhoGodIs", ofType: "txt")
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


}
