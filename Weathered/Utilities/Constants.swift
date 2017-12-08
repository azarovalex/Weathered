//
//  Constants.swift
//  weathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation

typealias DownloadComlete = () -> ()

let HOME_PAGE = "http://openweathermap.org"
let NOTIF_DOWN_COMPL = NSNotification.Name("dataDownloaded")

let LONG = Location.instance.longitude
let LAT = Location.instance.latitude

let API_KEY = "&appid=f161837945993cb0c22763d3ce3549a6"
let API_UNITS = "&units=metric"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=\(LAT)&lon=\(LONG)" + API_KEY + API_UNITS
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast?lat=\(LAT)&lon=\(LONG)" + API_UNITS + API_KEY
