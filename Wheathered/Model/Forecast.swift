//
//  Forecast.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation
import SwiftyJSON

class Forecast {
    fileprivate var _date: String!
    fileprivate var _wheatherType: String!
    fileprivate var _highTemp: Int!
    fileprivate var _lowTemp: Int!
    
    var date: String {
        get {
            return _date
        } set {
            _date = newValue
        }
    }
    
    var wheatherType: String {
        get {
            return _wheatherType
        } set {
            _wheatherType = newValue
        }
    }
    
    var highTemp: Int {
        get {
            return _highTemp
        } set {
            _highTemp = newValue
        }
    }
    
    var lowTemp: Int {
        get {
            return _lowTemp
        } set {
            _lowTemp = newValue
        }
    }
    
    class func loadForecastFromData(_ APIData: Data) -> [Forecast] {
        var forecast = [Forecast]()
        let json = try! JSON(data: APIData)
        
        if let list = json["list"].array {
            for index in 0..<8 {
                var day = list[index]
                let dayForecast = Forecast()
                dayForecast.highTemp = day["temp"]["max"].intValue
                dayForecast.lowTemp = day["temp"]["min"].intValue
                dayForecast.wheatherType = day["wheather"][0]["name"].stringValue
                
                let date = day["dt"].doubleValue
                let unixConvertedDate = Date(timeIntervalSince1970: date)
                dayForecast.date = unixConvertedDate.dayOfTheWeek()
                forecast.append(dayForecast)
            }
        }
        return forecast
    }
}
