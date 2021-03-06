//
//  AppDelegate.swift
//  weathered
//
//  Created by Alex Azarov on 07/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa
import CoreLocation

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, CLLocationManagerDelegate {

    // Variables
    let statusitem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.distanceFilter = 1000
        locationManager.startUpdatingLocation()

        statusitem.button?.title =  "--°"
        statusitem.action = #selector(AppDelegate.displayPopUp(_:))

        let updateWeatherData = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(AppDelegate.dowloadWeatherData), userInfo: nil, repeats: true)
        updateWeatherData.tolerance = 60
        dowloadWeatherData()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[locations.count - 1]
        Location.instance.latitude = currentLocation.coordinate.latitude
        Location.instance.longitude = currentLocation.coordinate.longitude
        dowloadWeatherData()
    }

    func dowloadWeatherData() {
        WeatherService.instance.downloadWeatherDetails {
            self.statusitem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
            WeatherService.instance.downloadForecast {
                NotificationCenter.default.post(name: NOTIF_DOWN_COMPL, object: nil)
                self.locationManager.stopUpdatingLocation()
            }
        }
    }

    func displayPopUp(_ sender: AnyObject?) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: "weatherVC") as? NSViewController else { return }
        let popoverView = NSPopover()
        popoverView.contentViewController = vc
        popoverView.behavior = .transient
        popoverView.show(relativeTo: statusitem.button!.bounds, of: statusitem.button!, preferredEdge: .maxY)
    }
}


