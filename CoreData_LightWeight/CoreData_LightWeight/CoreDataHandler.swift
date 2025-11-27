//
//  CoreDataHandler.swift
//  CoreData_LightWeight
//
//  Created by MOBILE HUTT on 27/11/25.
//

import Foundation
import CoreData

class CoreDataHandler {
    static let shared = CoreDataHandler()
    
    let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = PersistenceController.shared.context
    }
    
    func createPerson(name: String, email: String?) {
        var person = Person(context: viewContext)
        person.name = name
        person.email = email
        save()
    }
    
    func fetch() -> [Person] {
        let fetchRequest = Person.fetchRequest()
        return try! viewContext.fetch(fetchRequest)
    }
    
    func updatePerson(person: Person, name: String, email: String) {
        person.name = name
        person.email = email
        save()
    }
    
    func deletePerson(person: Person) {
        viewContext.delete(person)
        save()
    }
    
    func save() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            }catch {
                print("Saving failed with some error: \(error)")
            }
        }
    }
    
    
}
