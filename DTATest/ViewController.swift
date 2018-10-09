//
//  ViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 9/4/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//


import UIKit
import Foundation
import CoreData




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

        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext //PROBLEM
        
        
        let entity = NSEntityDescription.entity(forEntityName: "DailyTheoEntity", in: context)
        let newDTE = NSManagedObject(entity: entity!, insertInto: context)
        
        
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
                        newDTE.setValue(clientdata[0], forKey: "name")
                        newDTE.setValue(clientdata[1], forKey: "quote")
                        newDTE.setValue(clientdata[2], forKey: "topic")
                        newDTE.setValue(false, forKey: "favorited")
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
       
        do {
            
            try context.save()
            
        } catch {
            
            print("Failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DailyTheoEntity")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
       */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    
}


