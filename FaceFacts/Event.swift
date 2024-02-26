//
//  Event.swift
//  FaceFacts
//
//  Created by Anypli M1 Air on 26/2/2024.
//

import Foundation
import SwiftData

@Model
class Event {
    var name: String
    var location: String
    var peoplpe = [Person]()
    
    init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
