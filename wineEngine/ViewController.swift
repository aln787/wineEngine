//
//  ViewController.swift
//  wineEngine
//
//  Created by Niderberg, Alex on 8/24/15.
//  Copyright (c) 2015 Niderberg, Alex. All rights reserved.
//



import UIKit
import Parse

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var parseItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className:"Resturant")
        query.findObjectsInBackgroundWithBlock({
            (objectsArray : [AnyObject]?, error: NSError?) -> Void in
            
            //self.parseItems = objectsArray!
            for obj in objectsArray! {
                var str = obj["name"]
                self.parseItems.append(str! as! String)
//                NSLog("Object: \(str)")
            }
            
            self.tableView.reloadData()
            
            
            var objectIDs = objectsArray as! [PFObject]
            
//            NSLog("\(objectIDs)")
        })
        
///////Get a single object from parse
//        query.getObjectInBackgroundWithId("xWMyZEGZ") {
//            (gameScore: PFObject?, error: NSError?) -> Void in
//            if error == nil && gameScore != nil {
//                println(gameScore)
//            } else {
//                println(error)
//            }
//        }
        
        
        //Using this instead of the storyboard prototye cell
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.parseItems[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parseItems.count;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("questions", sender: self)
    }

}

