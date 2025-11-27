//
//  CoreData_LightWeightApp.swift
//  CoreData_LightWeight
//
//  Created by MOBILE HUTT on 27/11/25.
//

import SwiftUI

@main
struct CoreData_LightWeightApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.context)
        }
    }
}
