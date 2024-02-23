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

    @NSManaged public var id: UUID?
    @NSManaged public var movieID: Int64
    @NSManaged public var movieName: String?
    @NSManaged public var theaterName: String?
    @NSManaged public var date: Date?
    @NSManaged public var time: String?
    @NSManaged public var seatNum: Int64
    @NSManaged public var dateBooking: Date?

}

extension Bookings : Identifiable {

}
