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
    @IBOutlet weak var poweredBybtn: NSButton!
    @IBOutlet weak var quitBtn: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLbl.stringValue = "This is a date"
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func viewDidAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector (WeatherVC.dataDownloadedNotif(_:)), name: NOTIF_DOWN_COMPL, object: nil)
        UpdateUI()
        // quitBtn.styleButtonText(button: quitBtn, buttonName: "Quit", fontColor: .darkGray, alignment: .center, font: "Avenir Next", size: 11)
        // poweredBybtn.styleButtonText(button: poweredBybtn, buttonName: "Powered by OpenWeatherMap", fontColor: .darkGray, alignment: .center, font: "Avenir NExt", size: 11)
    }
    
    override func viewDidDisappear() {
        NotificationCenter.default.removeObserver(self, name: NOTIF_DOWN_COMPL, object: nil)
    }
    
    func dataDowloadedNotif(_ notif: Notification) {
        UpdateUI()
        print("hi")
    }
    
    @IBAction func poweredByBtnClicked(_ sender: Any) {
        let url = URL(string: HOME_PAGE)!
        NSWorkspace.shared().open(url)
    }
    
    @IBAction func quitBtnClicked(_ sender: Any) {
        NSApplication.shared().terminate(nil)
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
        
        guard let forecastCell = forecastItem as? weatherCell else
        { return forecastItem }
        forecastCell.ConfigureCell(weatherCell: WeatherService.instance.forecast[indexPath.item])
        return forecastCell
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return WeatherService.instance.forecast.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 125, height: 125)
    }
}











