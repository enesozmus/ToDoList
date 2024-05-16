//
//  AddToDoItemView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct AddToDoItemView: View {
    
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                Button {
                    
                } label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }
            .padding(12)
        }
        .navigationTitle("Add an Item 🖊")
    }
}

#Preview {
    NavigationStack {
        AddToDoItemView()
    }
}
