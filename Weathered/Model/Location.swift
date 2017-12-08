//
//  Location.swift
//  Weathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation

class Location {
    static var instance = Location()
    
    fileprivate var _latitude: Double = 53.9
    fileprivate var _longitude: Double = 27.56667

    var latitude: Double {
        get {
            return _latitude
        } set {
            _latitude = newValue
        }
    }
    
    var longitude: Double {
        get {
            return _longitude
        } set {
            _longitude = newValue
        }
    }
    
    
    
}
