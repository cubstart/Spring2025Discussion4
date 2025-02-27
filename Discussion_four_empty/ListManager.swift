//
//  ListManager.swift
//  Discussion_four
//
//  Created by Dylan Chhum on 2/27/25.
//
import SwiftUI


class ListViewModel {
    var todoItems: [ListItem] = []
    var newTodo : String = ""
    var filterMode : FilterMode = .all
    
    enum FilterMode {
        case all
        case completed
        case active
    }
    
    var filterList: [ListItem] {
        switch filterMode {
        case .all:
            return todoItems
        case .active:
            return todoItems.filter { !$0.isComplete }
        case .completed:
            return todoItems.filter { $0.isComplete }
        }
    }
    
    
    var activeCount : Int {
        return todoItems.filter { !$0.isComplete}.count
    }
    
    var completeCount : Int {
        return todoItems.filter { $0.isComplete}.count
    }
    
    func addTodo() {
        let trimmedText = newTodo.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }
        todoItems.append(ListItem (text: trimmedText))
        newTodo = ""
        
    }
    
    func removeTodo(at indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
    
    func setFilter (_ filter: FilterMode) {
        filterMode = filter
    }
    
    func addSampleData() {
           todoItems = [
               ListItem(text: "Go to Cubstart"),
               ListItem(text: "Build a Todo App", isComplete: true),
               ListItem(text: "mini-project 1"),
               ListItem(text: "Midterms")
           ]
       }
    
}
