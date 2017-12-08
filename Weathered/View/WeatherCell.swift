//
//  WheatherCell.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa

class WheatherCell: NSCollectionViewItem {
    
    @IBOutlet weak var wheatherImage: NSImageView!
    @IBOutlet weak var lowTemp: NSTextField!
    @IBOutlet weak var highTemp: NSTextField!
    @IBOutlet weak var cellDate: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        self.view.layer?.cornerRadius = 5
    }
    
    func ConfigureCell(weatherCell: Forecast) {
        
    }
}
