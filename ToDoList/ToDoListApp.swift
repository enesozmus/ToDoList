//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

/*
    MVVM Architecture
 
        Model - manages single data point
        View - manages the UI
        ViewModel - manages data (models) for views
 */

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ToDoListView()
            }
        }
    }
}
