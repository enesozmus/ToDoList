//
//  ToDoItem.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import Foundation

struct ToDoItemModel :Identifiable {
    var id: String = UUID().uuidString
    
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ToDoItemModel {
        return ToDoItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
