//
//  List.swift
//  Discussion_four
//
//  Created by Dylan Chhum on 2/27/25.
//
import SwiftUI

//What needs to be added 
class ListItem: Identifiable {
    let id: UUID
    var text: String
    var isComplete: Bool
    
    init(id: UUID = UUID() , text: String, isComplete: Bool = false ) {
        self.id = id
        self.text = text
        self.isComplete = isComplete
    }
}
