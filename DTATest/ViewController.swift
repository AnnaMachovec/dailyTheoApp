//
//  ViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/4/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//


import UIKit
import Foundation




class ViewController: UIViewController {
    
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    var dailyObjectList = [dailyTheoObject]()
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        view.addBackground()
        process()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func process(){
        let bundle = Bundle.main
        let newpath = bundle.path(forResource: "dailytheo", ofType: "txt")
        let filemgr = FileManager.default
        if filemgr.fileExists(atPath: newpath!){
            do {
                let fulltext = try String(contentsOfFile: newpath!, encoding: String.Encoding.utf8)
                let readings = fulltext.components(separatedBy: "\n")
                for i in readings{
                    let clientdata = i.components(separatedBy: ":")
                    if !(clientdata[0].isEmpty){
                        let temp = dailyTheoObject(name: clientdata[0], quote: clientdata[1], favorited: false)
                        dailyObjectList.append(temp)
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
    }
    
    
}


