//
//  CurrentWeather.swift
//  Weathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWeather {
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _weatherType: String!
    fileprivate var _currentTemp: Int!
    
    var cityName: String {
        get {
            return _cityName
        }
        set {
            _cityName = newValue
        }
    }
    
    var date: String {
        get {
            return _date
        }
        set {
            _date = newValue
        }
    }
    
    var weatherType: String {
        get {
            return _weatherType
        }
        set {
            _weatherType = newValue
        }
    }
    
    var currentTemp: Int {
        get {
            return _currentTemp
        }
        set {
            _currentTemp = newValue
        }
    }
    
    class func loadCurrentWeatherFromData(_ APIData: Data) -> CurrentWeather {
        
        let currentweather = CurrentWeather()
        let swiftyJSON = try! JSON(data: APIData)
        
        currentweather.cityName = swiftyJSON["name"].stringValue.capitalized
        currentweather.weatherType = swiftyJSON["weather"][0]["main"].stringValue.capitalized
        currentweather.currentTemp = swiftyJSON["main"]["temp"].intValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        currentweather.date = "Today, " + currentDate
        
        
        return currentweather
    }
    
    
}
