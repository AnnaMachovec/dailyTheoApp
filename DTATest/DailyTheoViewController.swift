//
//  DailyTheoViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 11/19/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit

//DailyTheoViewController class has currently a random quote pop up when one clicks on "Daily Quote" in the Main menu of the welcomeViewController


class DailyTheoViewController: UIViewController {
@IBOutlet var topLabel: UILabel!
@IBOutlet var textView: UITextView!
@IBOutlet var nameLabel: UILabel!
    var nameofTheologian:String = "" //stores name of Theologian
    var listOfQuotes = [String]() // this is an array of Strings holding the quotes of the theologian
    var currentList = [String]()
    var isSearching = false
    var dailyObjectList = [dailyTheoObject]()
    var todaysquote:String = ""
   
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.backgroundColor = UIColor.clear
        topLabel.text = "Random Quote"
        process()
        let randomquote = Int(arc4random_uniform(UInt32(dailyObjectList.count)))
        var tempobj = dailyObjectList[randomquote]
        textView.text = tempobj.theoquote
        nameLabel.text = tempobj.theoname
        
    }
    
    
    //func process is a function that creates objects by parsing data from the AllQuotes.txt file
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
                        
                        //saves the information of the name of theologian, a quote they said, the topics in the quote, and  a false boolean
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
