//
//  EditPersonView.swift
//  FaceFacts
//
//  Created by Anypli M1 Air on 26/2/2024.
//

import SwiftUI

struct EditPersonView: View {
    // ObservableObject is replaced by Observale in macro
    // @Binding: is used for local references to external state
    @Bindable var person: Person // Bindable: observable macro object type to create bindings from it
    
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                
                TextField("Email Address", text: $person.email)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Section {
                TextField("Details about this person", text: $person.details, axis: .vertical)
            }
        }
        .navigationTitle("Edit Person")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditPersonView(person: <#T##Person#>)
//}
