//
//  ToDoListRowView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct ToDoListRowView: View {
    
    //let title: String
    let item: ToDoItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            //Text(title)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 7)
    }
}

//#Preview {
//    ToDoListRowView(title: "This is the first title!")
//}

//#Preview("This is the first title") {
//    ToDoListRowView(item: ToDoItemModel(title: "This is the first item", isCompleted: false))
//}
//#Preview("This is the second title") {
//    ToDoListRowView(item: ToDoItemModel(title: "This is the second item", isCompleted: true))
//}

#Preview() {
    Group {
        ToDoListRowView(item: ToDoItemModel(title: "This is the first item", isCompleted: false))
        ToDoListRowView(item: ToDoItemModel(title: "This is the second item", isCompleted: false))
    }
    .previewLayout(.sizeThatFits)
}
