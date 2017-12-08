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
    
    func downloadWheatherDetails() {
        let url = URL(string: API_URL_CURRENT_WEATHER)
        Alamofire.request(url!).responseJSON { (response) in
            print(response.result.value ?? "")
        }
    }
}

