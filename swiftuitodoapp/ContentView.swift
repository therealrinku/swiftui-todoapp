//
//  ContentView.swift
//  swiftuitodoapp
//
//  Created by Rinku Chaudhari on 8/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = TodoViewModel();
    @State var value:String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                if vm.todos.isEmpty{
                    Spacer()
                    
                    ZStack{
                        Text("Nothing found").bold()
                    }
                } else {
                    VStack {
                        Text("Todos").bold()
                        List(){
                            ForEach(vm.todos){ todo in
                                NavigationLink(destination: TodoDetailView(todo:todo, vm: vm)){
                                    Text(todo.title)
                                        .onTapGesture {
                                            vm.fiddle(idx: todo.id)
                                        }
                                        .foregroundColor(
                                        todo.is_completed ?
                                        Color.gray : Color.black)
                                        .onLongPressGesture {
                                        vm.removeTodo(idx: todo.id)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Spacer()
                
                HStack{
                    TextField("New Todo", text: $value)
                    
                    Button(action: addTodo){
                        Text("Add todo")
                    }
                }.padding()
            }
            
        }
    }
    
    
    func addTodo(){
        vm.addTodo(todo: value)
        value=""
    }
}

#Preview {
    ContentView()
}
