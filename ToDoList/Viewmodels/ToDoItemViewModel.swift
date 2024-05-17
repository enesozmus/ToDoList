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
    
    @Published var items: [ToDoItemModel] = [] {
        didSet {
            saveToDoItems()
        }
    }
    let itemsKey: String = "items_key"
    
    init() {
        getToDoItems()
    }
    
    func getToDoItems() {
        //        let newToDoItems = [
        //            ToDoItemModel(title: "This is the first item!", isCompleted: false),
        //            ToDoItemModel(title: "This is the second item!", isCompleted: false),
        //            ToDoItemModel(title: "Third!", isCompleted: true)
        //        ]
        //        items.append(contentsOf: newToDoItems)
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let decodedSavedItems = try? JSONDecoder().decode([ToDoItemModel].self, from: data)
        else { return }
        
        self.items = decodedSavedItems
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
    func saveToDoItems(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
