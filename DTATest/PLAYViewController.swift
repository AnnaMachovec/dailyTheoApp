//
//  PLAYViewController.swift
//  DTATest
//
//  Created by Anna Machovec on 10/4/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit
import CoreData

class PLAYViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "DailyTheoEntity", in: context)
        let newDTE = NSManagedObject(entity: entity!, insertInto: context)
        
        
        newDTE.setValue("Anna", forKey: "name")
        newDTE.setValue("Hello World", forKey: "quote")
        newDTE.setValue("Love", forKey: "topic")
        //newUser.setValue("false", forKey: "favorited")
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Failed saving")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
