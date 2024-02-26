//
//  Previewer.swift
//  FaceFacts
//
//  Created by Anypli M1 Air on 26/2/2024.
//

import Foundation
import SwiftData

@MainActor
struct Previewer {
    let container: ModelContainer
    let event: Event
    let person: Person
    
    init() throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Person.self, configurations: config)
        
        event = Event(name: "Dimension Jump", location: "Nottingham")
        person = Person(name: "Ahmed", email: "ahmed@gmail.com", details: "", metAt: event)
        container.mainContext.insert(person)
    }
}
