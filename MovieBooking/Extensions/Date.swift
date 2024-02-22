//
//  Date.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/19/24.
//

import Foundation
import SwiftUI

extension Date {
    func dayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
    
    func dayMonth() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: self)
    }
    
    func dayMonthYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: self)
    }
    
    func getHour() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: self)
        
        var calendar = Calendar.current

        if let timeZone = TimeZone(identifier: "VN") {
           calendar.timeZone = timeZone
        }

        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        let second = calendar.component(.second, from: self)
        
        return String(hour) + ":" + String(minute) + ":" + String(second) + ", " + dateString
    }
}
