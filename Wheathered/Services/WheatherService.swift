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
    
    var currentWheather: CurrentWheather {
        get {
            return _currentWheather
        }
        set {
            _currentWheather = newValue
        }
    }
    
    func downloadWheatherDetails(comlpete: @escaping DownloadComlete) {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseData { (response) in
            self.currentWheather = CurrentWheather.loadCurrentWheatherFromData(response.data!)
            comlpete()
        }
    }
}

