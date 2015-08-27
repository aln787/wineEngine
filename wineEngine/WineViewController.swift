//
//  WineViewController.swift
//  wineEngine
//
//  Created by Niderberg, Alex on 8/27/15.
//  Copyright (c) 2015 Niderberg, Alex. All rights reserved.
//

import UIKit
import Parse

class WineViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var bottles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Bottle")
        query.findObjectsInBackgroundWithBlock({
            (objectsArray : [AnyObject]?, error: NSError?) -> Void in
            
            for obj in objectsArray! {
                var str = obj["name"]
                self.bottles.append(str! as! String)
            }
            
            self.tableView.reloadData()
        })
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("bottle") as! UITableViewCell
        cell.textLabel!.text = bottles[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bottles.count;
    }
    
    
}
