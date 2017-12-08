//
//  Constants.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation

typealias DownloadComlete = () -> ()

let API_KEY = "&appid=f161837945993cb0c22763d3ce3549a6"
let API_UNITS = "&units=metric"
let API_URL_CURRENT_WEATHER = "http://api.openweathermap.org/data/2.5/weather?lat=53.9&lon=27.5667" + API_KEY + API_UNITS
let API_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast?lat=53.9&lon=27.5667" + API_UNITS + API_KEY
