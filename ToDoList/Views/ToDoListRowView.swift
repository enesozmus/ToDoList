//
//  ToDoListRowView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct ToDoListRowView: View {
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    ToDoListRowView(title: "This is the first title!")
}
