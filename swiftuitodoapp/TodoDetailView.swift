//
//  TodoDetailView.swift
//  swiftuitodoapp
//
//  Created by Rinku Chaudhari on 8/3/24.
//

import SwiftUI

struct TodoDetailView: View {
    var todo:TodoModel;
    @State private var value:String = "";
    @State private var is_completed:Bool = false;
    @ObservedObject var vm:TodoViewModel;
    
    @Environment(\.presentationMode) var presentationMode;
    
    var body: some View {
        Form{
            Section("Edit Todo - \(todo.title)"){
                TextField("Todo title", text: $value)
                Toggle(isOn: $is_completed){
                    Text("Is Completed")
                }
                HStack(spacing: 25){
                    Spacer();
                    
                    Button("Save"){
                        vm.update(idx: todo.id, newTitle: value, is_completed: is_completed)
                        self.presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(value == todo.title && is_completed == todo.is_completed ? Color.gray : Color.green)
                        .disabled(value == todo.title && is_completed == todo.is_completed)
                    Button("Cancel"){
                        self.presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(Color.red)
                }
            }
        }.onAppear(){
            value = self.todo.title
            is_completed = self.todo.is_completed;
        }
    }
}

#Preview {
    TodoDetailView(todo:TodoModel(title:"hello", is_completed: false), vm: TodoViewModel())
}
