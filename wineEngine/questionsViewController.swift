//
//  questionsViewController.swift
//  wineEngine
//
//  Created by Niderberg, Alex on 8/24/15.
//  Copyright (c) 2015 Niderberg, Alex. All rights reserved.
//

import Foundation



import UIKit
import Parse

class questionsViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet
    var tableView: UITableView!
    
    var items: [String] = ["How Bold do you like your wine?"]
//    var parseItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// TODO: Store / retrieve data from parse
//////Getting ready to store data in parse
//        let testObject = PFObject(className: "question")
//        testObject["detail"] = "How Bold do you like your wine?"
//        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
//            println("Object has been saved.")
//        }
        
        
        
        //Removing this line to use the protype cell declared in the storyboard
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "sliderCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if ((indexPath.row + 1) > self.items.count) {
            var starCell = self.tableView.dequeueReusableCellWithIdentifier("starCell") as! StarTableViewCell
            starCell.configure(text: "How jammy do you like your wine?")
            return starCell
        } else {
            var cell = self.tableView.dequeueReusableCellWithIdentifier("sliderCell") as! SliderTableViewCell
            cell.configure(text: self.items[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count + 1;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
// TODO: Add a transition out of this view controller
//        self.performSegueWithIdentifier("questions", sender: self)
    }
    
}


