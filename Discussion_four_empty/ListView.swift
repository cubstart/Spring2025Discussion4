//
//  ListView.swift
//  Discussion_four
//
//  Created by Dylan Chhum on 2/27/25.
//
import SwiftUI

struct ListView: View {
    @State private var newTodo: String = ""
    @State private var filterMode: FilterMode = .all
    @State private var todoItems: [ListItem] = []
    
    enum FilterMode {
        case all, completed, active
    }
    
    var filteredList: [ListItem] {
        switch filterMode {
        case .all:
            return todoItems
        case .active:
            return todoItems.filter { !$0.isComplete }
        case .completed:
            return todoItems.filter { $0.isComplete }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("New Todo", text: $newTodo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: addTodo) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                    .disabled(newTodo.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                
                FilterView(filterMode: $filterMode)
                    .padding(.horizontal)
                
                List {
                    ForEach($todoItems) { $list in
                        ListRowView(list: $list)
                    }
                    .onDelete(perform: removeTodo)
                }
                
                StatsFooterView(activeCount: todoItems.filter { !$0.isComplete }.count, completedCount: todoItems.filter { $0.isComplete }.count)
                    .padding()
            }
            .navigationTitle("Oski's Todo")
        }
    }
    
    private func addTodo() {
        let trimmedText = newTodo.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }
        todoItems.append(ListItem(text: trimmedText))
        newTodo = ""
    }
    
    private func removeTodo(at indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }
}

struct FilterView: View {
    @Binding var filterMode: ListView.FilterMode
    
    var body: some View {
        HStack {
            FilterButton(title: "All", isActive: filterMode == .all) {
                filterMode = .all
            }
            FilterButton(title: "Active", isActive: filterMode == .active) {
                filterMode = .active
            }
            FilterButton(title: "Completed", isActive: filterMode == .completed) {
                filterMode = .completed
            }
        }
    }
}

struct FilterButton: View {
    let title: String
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .padding(.vertical, 6)
                .padding(.horizontal, 12)
                .background(isActive ? Color.blue.opacity(0.2) : Color.clear)
                .cornerRadius(8)
        }
        .foregroundColor(isActive ? .blue : .primary)
    }
}

#Preview {
    ListView()
}

