//
//  ContentView.swift
//  CoreData_LightWeight
//
//  Created by MOBILE HUTT on 27/11/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)],
        animation: .default)
    private var persons: FetchedResults<Person>
    
    @State private var name = ""
    @State private var email = ""
    
    private let coreDataHandler = CoreDataHandler.shared
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                VStack(spacing: 20) {
                    
                    TextField("Enter name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    Button("Add") {
                        coreDataHandler.createPerson(name: name, email: email)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)
                
                List {
                    ForEach(persons) { person in
                        HStack {
                            Text(person.name ?? "No Name")
                            
                            Spacer()
                            
                            Text("Email: \(person.email ?? "No email")")
                                .foregroundColor(.gray)
                            
                            Button("Edit") {
                                coreDataHandler.updatePerson(person: person, name: name, email: email)
                            }
                            .buttonStyle(.bordered)
                            
                            Button("Delete") {
                                coreDataHandler.deletePerson(person: person)
                            }
                            .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Core Data Light Weight Migration")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ContentView()
}
