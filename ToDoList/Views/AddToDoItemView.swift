//
//  AddToDoItemView.swift
//  ToDoList
//
//  Created by enesozmus on 16.05.2024.
//

import SwiftUI

struct AddToDoItemView: View {
    
    @EnvironmentObject var toDoItemViewModel: ToDoItemViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showingAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
                .disabled(textFieldText.count < 3)
            }
            .padding(12)
        }
        .navigationTitle("Add an Item 🖊")
        //.alert(isPresented: $showingAlert, content: getAlert)
    }
    
    // MARK: FUNCTIONS
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            toDoItemViewModel.addItem(title: textFieldText)
            dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new to do item must be at least 3 characters long!!! 😨😰😱"
            showingAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddToDoItemView()
    }
    .environmentObject(ToDoItemViewModel())
}
