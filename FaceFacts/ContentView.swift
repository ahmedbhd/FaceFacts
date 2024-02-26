//
//  ContentView.swift
//  FaceFacts
//
//  Created by Anypli M1 Air on 26/2/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    @Query var people: [Person]
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(people) { person in
                    NavigationLink(value: person) {
                        Text(person.name)
                    }
                }
                .onDelete(perform: deletePeople)
            }
            .navigationTitle("FaceFacts")
            .navigationDestination(for: Person.self) { person in
                EditPersonView(person: person)
            }
            .toolbar {
                Button("Add Person", systemImage: "plus", action: addPerson)
            }
        }
    }
    
    func addPerson() {
        let person = Person(name: "", email: "", details: "")
        modelContext.insert(person)
        path.append(person)
    }
    
    func deletePeople(at offSets: IndexSet) {
        for offset in offSets {
            let person = people[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    ContentView()
}
