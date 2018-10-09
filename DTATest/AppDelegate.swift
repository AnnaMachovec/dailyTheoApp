//
//  AppDelegate.swift
//  DTATest
//
//  Created by Anna Machovec on 9/4/18.
//  Copyright © 2018 Anna Machovec. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dailyObjectList = [dailyTheoObject]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    self.saveContext()
    }
    
    // MARK: - Core Data Saving support
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "dailyModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    /*
    func process() -> [dailyTheoObject]?{
        
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
                        let temp = dailyTheoObject(name: clientdata[0], quote: clientdata[1], favorited: false)
                        dailyObjectList.append(temp)
                        
                    }
                }
            }catch let error as NSError {
                print(error)
            }
        }
        return dailyObjectList
    }//process func
    
    func preloadData () {
        // Retrieve data from the source file
        
            // Remove all the menu items before preloading
            removeData()
        let appDelegate = NSApplication.shared().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
            var error:NSError?
                if managedObjectContext = self.managedObjectContext {
                    for item in dailyObjectList {
                        let menuItem = NSEntityDescription.insertNewObjectForEntityForName("DailyTheoEntity", inManagedObjectContext: managedObjectContext) as! MenuItem
                        menuItem.name = item.name
                        menuItem.detail = item.detail
                        menuItem.price = (item.price as NSString).doubleValue
                        
                        if managedObjectContext.save(&error) != true {
                            println("insert error: \(error!.localizedDescription)")
                        }
                    }
                }
        }
    
    func removeData () {
        // Remove the existing items
        if let managedObjectContext = self.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: "MenuItem")
            var e: NSError?
            let menuItems = managedObjectContext.executeFetchRequest(fetchRequest, error: &e) as! [MenuItem]
            
            if e != nil {
                println("Failed to retrieve record: \(e!.localizedDescription)")
                
            } else {
                
                for menuItem in menuItems {
                    managedObjectContext.deleteObject(menuItem)
                }
            }
        }
    }

*/
}

