//
//  PeopleView.swift
//  FaceFacts
//
//  Created by Anypli M1 Air on 26/2/2024.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    @Environment(\.modelContext) var modelContext
    @Query var people: [Person]

    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    init(searchString: String = "") {
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                true
            } else {
                person.name.localizedStandardContains(searchString) || person.email.localizedStandardContains(searchString) || person.details.localizedStandardContains(searchString)
            }
        })
    }
    
    func deletePeople(at offSets: IndexSet) {
        for offset in offSets {
            let person = people[offset]
            modelContext.delete(person)
        }
    }
}

#Preview {
    PeopleView()
}
