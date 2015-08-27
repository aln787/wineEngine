//
//  StarTableViewCell.swift
//  wineEngine
//
//  Created by Niderberg, Alex on 8/25/15.
//  Copyright (c) 2015 Niderberg, Alex. All rights reserved.
//

import UIKit

public class StarTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBAction func select1(sender: UIButton) {
        sender.selected = !sender.selected;
        if !sender.selected {
            buttons[1].selected = false
            buttons[2].selected = false
            buttons[3].selected = false
            buttons[4].selected = false
        }
    }
    
    @IBAction func select2(sender: UIButton) {
        sender.selected = !sender.selected;
        if sender.selected {
            buttons[0].selected = true
        } else {
            buttons[2].selected = false
            buttons[3].selected = false
            buttons[4].selected = false
        }
    }
    
    @IBAction func select3(sender: UIButton) {
        sender.selected = !sender.selected;
        if sender.selected {
            buttons[0].selected = true
            buttons[1].selected = true
        } else {
            buttons[3].selected = false
            buttons[4].selected = false
        }
    }
    
    @IBAction func select4(sender: UIButton) {
        sender.selected = !sender.selected;
        if sender.selected {
            buttons[0].selected = true
            buttons[1].selected = true
            buttons[2].selected = true
        } else {
            buttons[4].selected = false
        }
    }
    
    @IBAction func select5(sender: UIButton) {
        sender.selected = !sender.selected;
        if sender.selected {
            buttons[0].selected = true
            buttons[1].selected = true
            buttons[2].selected = true
            buttons[3].selected = true
        }
    }
    
    
    public func configure(text: String, numStars: Int) {
        label.text = text
        NSLog("Number of stars: %d", numStars)
        for index in 1...numStars {
            buttons[index - 1].selected = true
        }
        for button in buttons {
            button.setImage(UIImage(named: "Star_selected"), forState: UIControlState.Selected)
            button.setImage(UIImage(named: "Star_notSelected"), forState: UIControlState.Normal)
        }
    }
}
