//
//  ToDoItemViewModel.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import Foundation

/*
    CRUD FUNCTIONS:
 
        Create
        Read
        Update
        Delete
 */

class ToDoItemViewModel: ObservableObject {
    @Published var items: [ToDoItemModel] = []
    
    init() {
        getToDoItems()
    }
    
    func getToDoItems() {
        let newToDoItems = [
            ToDoItemModel(title: "This is the first item!", isCompleted: false),
            ToDoItemModel(title: "This is the second item!", isCompleted: false),
            ToDoItemModel(title: "Third!", isCompleted: true)
        ]
        items.append(contentsOf: newToDoItems)
    }
    func addItem(title: String) {
        let newToDoItem = ToDoItemModel(title: title, isCompleted: false)
        items.append(newToDoItem)
    }
    func moveToDoItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    func removeToDoItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    func updateToDoItem(item: ToDoItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
