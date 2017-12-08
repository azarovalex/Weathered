//
//  weatherCell.swift
//  weathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa

class weatherCell: NSCollectionViewItem {
    
    @IBOutlet weak var weatherImage: NSImageView!
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
        weatherImage.image = NSImage(named: weatherCell.weatherType)
        highTemp.stringValue = String(weatherCell.highTemp) + "°"
        lowTemp.stringValue = String(weatherCell.lowTemp) + "°"
        cellDate.stringValue = weatherCell.date
    }
}
