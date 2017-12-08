//
//  WheatherService.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation
import Alamofire

class WheatherService {
    static let instance = WheatherService()
    fileprivate var _currentWheather = CurrentWheather()
    fileprivate var _forecast = [Forecast]()
    
    var currentWheather: CurrentWheather {
        get {
            return _currentWheather
        }
        set {
            _currentWheather = newValue
        }
    }
    
    var forecast: [Forecast] {
        get {
            return _forecast
        } set {
            _forecast = newValue
        }
    }
    
    func downloadWheatherDetails(comlpeted: @escaping DownloadComlete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData { (response) in
            self.currentWheather = CurrentWheather.loadCurrentWheatherFromData(response.data!)
            comlpeted()
        }
    }
    
    func downloadForecast(completed: @escaping DownloadComlete) {
        let url = URL(string: API_URL_FORECAST)
        Alamofire.request(url!).responseData { (response) in
            self.forecast = Forecast.loadForecastFromData(response.data!)
            if self.forecast.count > 0 {
                self.forecast.remove(at: 0)
            }
            completed()
        }
    }
}

