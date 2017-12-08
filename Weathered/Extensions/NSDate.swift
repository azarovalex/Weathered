//
//  NSDate.swift
//  Wheathered
//
//  Created by Alex Azarov on 08/12/2017.
//  Copyright © 2017 Alex Azarov. All rights reserved.
//

import Foundation

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, H:mm"
        return dateFormatter.string(from: self)
    }
}
