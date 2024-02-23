//
//  CoreDataManager.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager(modelName: "MovieBooking")
    let persistentContainer: NSPersistentContainer
    
    private init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}

extension CoreDataManager {
    func load(completion: (() -> Void)? = nil ) {
        persistentContainer.loadPersistentStores { description, error in
            guard error == nil else {
                fatalError("Unresolved error \(error?.localizedDescription)")
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            }
            catch {
                print("An error occurred while saving \(error.localizedDescription)")
            }
        }
    }
}

private extension CoreDataManager {
    
}
