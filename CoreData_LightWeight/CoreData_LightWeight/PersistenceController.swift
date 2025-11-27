//
//  PersistenceController.swift
//  CoreData_LightWeight
//
//  Created by MOBILE HUTT on 27/11/25.
//

import Foundation
import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    var persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "CoreData_LightWeight")
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Container loading failed with error: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
