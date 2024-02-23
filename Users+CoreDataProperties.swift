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
    @NSManaged public var username: String?
    @NSManaged public var password: String?

}

extension Users : Identifiable {

}
