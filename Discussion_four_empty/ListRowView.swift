//
//  TodoRowView.swift
//  Discussion_four
//
//  Created by Dylan Chhum on 2/27/25.
//
import SwiftUI

struct ListRowView: View {
    //Something here may need to change 
    @Binding var list: ListItem
    
    var body: some View {
        HStack {
            Button(action: {
                list.isComplete.toggle()
            }) {
                Image(systemName: list.isComplete ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(list.isComplete ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text(list.text)
                .strikethrough(list.isComplete)
                .foregroundColor(list.isComplete ? .gray : .primary)
                .animation(.default, value: list.isComplete)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .onTapGesture {
            list.isComplete.toggle()
        }
    }
}

#Preview {
    ListRowView(list: .constant(ListItem(text: "Sample Todo")))

}
