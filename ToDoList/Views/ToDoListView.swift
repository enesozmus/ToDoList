//
//  ToDoListView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    
    var body: some View {
        ZStack {
            if toDoItemViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(toDoItemViewModel.items) { item in
                        ToDoListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    toDoItemViewModel.updateToDoItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: toDoItemViewModel.removeToDoItem)
                    .onMove(perform: toDoItemViewModel.moveToDoItem)
                }
                .listStyle(.plain)
            }
        }
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
    .environmentObject(ToDoItemViewModel())
}
