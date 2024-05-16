//
//  ToDoListView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    //    @State var items: [String] = [
    //        "This is the first title!",
    //        "This is the second!",
    //        "ThirdQ"
    //    ]
    @State var items: [ToDoItemModel] = [
        ToDoItemModel(title: "This is the first item!", isCompleted: false),
        ToDoItemModel(title: "This is the second item!", isCompleted: false),
        ToDoItemModel(title: "Third!", isCompleted: true)
    ]
    
    var body: some View {
        List {
            //ForEach(items, id: \.self) { item in
            ForEach(items) { item in
                //ToDoListRowView(title: "This is the first title")
                //ToDoListRowView(title: item)
                ToDoListRowView(item: item)
            }
            .onDelete(perform: { indexSet in
                //
            })
        }
        .listStyle(.plain)
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    //Text("under development")
                    AddToDoItemView()
                } label: {
                    Text("Add")
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        ToDoListView()
    }
}
