//
//  CurrentWheather.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation
import SwiftyJSON

class CurrentWheather {
    fileprivate var _cityName: String!
    fileprivate var _date: String!
    fileprivate var _wheatherType: String!
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
    
    var wheatherType: String {
        get {
            return _wheatherType
        }
        set {
            _wheatherType = newValue
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
    
    class func loadCurrentWheatherFromData(_ APIData: Data) -> CurrentWheather {
        
        let currentWheather = CurrentWheather()
        let swiftyJSON = try! JSON(data: APIData)
        
        currentWheather.cityName = swiftyJSON["name"].stringValue.capitalized
        currentWheather.wheatherType = swiftyJSON["wheather"][0]["main"].stringValue.capitalized
        currentWheather.currentTemp = swiftyJSON["main"]["temp"].intValue
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        currentWheather.date = "Today, " + currentDate
        
        
        return currentWheather
    }
    
    
}
