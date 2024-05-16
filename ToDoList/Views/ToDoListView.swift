//
//  ToDoListView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @State var items: [String] = [
        "This is the first title!",
        "This is the second!",
        "ThirdQ"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                //ToDoListRowView(title: "This is the first title")
                ToDoListRowView(title: item)
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
