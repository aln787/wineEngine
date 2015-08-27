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
    var questions: [String] = []
    
    var items: [String] = ["How Bold do you like your wine?"]
//    var parseItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var query = PFQuery(className: "Questions")
        query.findObjectsInBackgroundWithBlock({
            (objectsArray : [AnyObject]?, error: NSError?) -> Void in
            
            for obj in objectsArray! {
                var str = obj["question"]
                self.questions.append(str! as! String)
            }
            
            self.tableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (indexPath.row == questions.count + 1) {
            //test
            var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("submit") as! UITableViewCell
            return cell
        } else if ((indexPath.row + 1) > self.items.count) {
            var starCell = self.tableView.dequeueReusableCellWithIdentifier("starCell") as! StarTableViewCell
            starCell.configure(questions[indexPath.row - 1], numStars: 3)
            return starCell
        } else {
            var cell = self.tableView.dequeueReusableCellWithIdentifier("sliderCell") as! SliderTableViewCell
            cell.configure(text: self.items[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count + 2;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
// TODO: Add a transition out of this view controller
//        self.performSegueWithIdentifier("questions", sender: self)
    }
    
}


