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
}
