//
//  Users+CoreDataProperties.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var bookings: NSSet?
    
    public var bookingsHistory: [Bookings] {
        let bookingsSet = bookings as? Set<Bookings> ?? []
        
        return Array(bookingsSet).sorted { lhs, rhs in
            lhs.dateBooking ?? Date.now > rhs.dateBooking ?? Date.now
        }
    }
}

// MARK: Generated accessors for bookings
extension Users {

    @objc(addBookingsObject:)
    @NSManaged public func addToBookings(_ value: Bookings)

    @objc(removeBookingsObject:)
    @NSManaged public func removeFromBookings(_ value: Bookings)

    @objc(addBookings:)
    @NSManaged public func addToBookings(_ values: NSSet)

    @objc(removeBookings:)
    @NSManaged public func removeFromBookings(_ values: NSSet)

}

extension Users : Identifiable {

}
