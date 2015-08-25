//
//  SliderCell.swift
//  wineEngine
//
//  Created by Niderberg, Alex on 8/25/15.
//  Copyright (c) 2015 Niderberg, Alex. All rights reserved.
//

import UIKit

public class SliderTableViewCell: UITableViewCell {
    
    @IBOutlet var label: UILabel!
    
    public func configure(#text: String?) {
        label.text = text
        
        label.accessibilityValue = text
    }
}
