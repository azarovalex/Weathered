//
//  AppDelegate.swift
//  weathered
//
//  Created by Alex Azarov on 07/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    // Variables
    let statusitem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusitem.button?.title =  "--°"
        statusitem.action = #selector(AppDelegate.displayPopUp(_:))
        
        WeatherService.instance.downloadWeatherDetails {
            self.statusitem.button?.title = "\(WeatherService.instance.currentWeather.currentTemp)°"
            WeatherService.instance.downloadForecast {
                NotificationCenter.default.post(name: NOTIF_DOWN_COMPL, object: nil)
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
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

