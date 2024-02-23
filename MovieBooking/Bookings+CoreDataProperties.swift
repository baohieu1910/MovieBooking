//
//  Bookings+CoreDataProperties.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//
//

import Foundation
import CoreData


extension Bookings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookings> {
        return NSFetchRequest<Bookings>(entityName: "Bookings")
    }

    @NSManaged public var date: Date?
    @NSManaged public var dateBooking: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var movieID: Int64
    @NSManaged public var movieName: String?
    @NSManaged public var seatNum: Int64
    @NSManaged public var theaterName: String?
    @NSManaged public var time: String?
    @NSManaged public var user: Users?

}

extension Bookings {
    func getCode() -> String {
        let name = (theaterName ?? "") + String(movieID)
        let time = (date?.dayMonthYear() ?? "") + (time ?? "") + String(seatNum)
        return name + time
    }
}

extension Bookings : Identifiable {

}
