//
//  weatherVC.swift
//  weathered
//
//  Created by Alex Azarov on 07/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa

class weatherVC: NSViewController {
    
    @IBOutlet weak var dateLbl: NSTextField!
    @IBOutlet weak var tempLbl: NSTextField!
    @IBOutlet weak var locationLbl: NSTextField!
    @IBOutlet weak var weatherImage: NSImageView!
    @IBOutlet weak var weatherConditionLbl: NSTextField!
    @IBOutlet weak var collectionView: NSCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLbl.stringValue = "This is a date"
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidAppear() {
        UpdateUI()
    }
    
    func UpdateUI () {
        let weather = WeatherService.instance.currentWeather
        dateLbl.stringValue = weather.date
        tempLbl.stringValue = String(weather.currentTemp) + "°"
        locationLbl.stringValue = weather.cityName
        weatherConditionLbl.stringValue = weather.weatherType
        weatherImage.image = NSImage(named: weather.weatherType)
        if weatherImage.image == nil {
            weatherImage.image = NSImage(named: "Snow")
        }
    }

}

extension weatherVC: NSCollectionViewDelegate, NSCollectionViewDataSource, NSCollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let forecastItem = collectionView.makeItem(withIdentifier: "WeatherCell", for: indexPath)
        return forecastItem
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}











