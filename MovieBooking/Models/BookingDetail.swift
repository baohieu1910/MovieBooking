//
//  BookingDetail.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/18/24.
//

import Foundation

struct BookingDetail: Codable, Identifiable {
    var id = UUID()
    var movieID: Int
    var theaterName: String
    var date: Date
    var time: String
    var seatNum: Int
    
    func getCode() -> String {
        return theaterName + String(movieID) + date.dayMonthYear() + time + String(seatNum)
    }
}


