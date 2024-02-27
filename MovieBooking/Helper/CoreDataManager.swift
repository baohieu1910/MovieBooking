//
//  CoreDataManager.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieBooking")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}

extension CoreDataManager {
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            }
            catch {
                print("ERROR: \(error.localizedDescription)")
            }
        }
    }
        
    func getAllUsers() -> [Users]{
        let request = NSFetchRequest<Users>(entityName: "Users")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func getAllBookings() -> [Bookings] {
        let request = NSFetchRequest<Bookings>(entityName: "Bookings")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}

private extension CoreDataManager {
    
}
