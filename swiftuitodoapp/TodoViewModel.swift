//
//  TodoViewModel.swift
//  swiftuitodoapp
//
//  Created by Rinku Chaudhari on 8/2/24.
//

import Foundation
import SwiftUI

struct TodoModel: Identifiable, Hashable{
    let id = UUID();
    var title:String;
    var is_completed: Bool;
}


class TodoViewModel: ObservableObject{
    @Published var todos:[TodoModel] = [];
    
    func update(idx:UUID, newTitle:String, is_completed: Bool){
        let todoIndex = todos.firstIndex{$0.id == idx}
        guard let todoIndex = todoIndex else{
            return
        }
        todos[todoIndex].is_completed = is_completed;
        todos[todoIndex].title = newTitle;
    }
    
    func addTodo(todo:String){
        todos.append(TodoModel(title:todo, is_completed: false))
    }

    func fiddle(idx: UUID){
        let todoIndex = todos.firstIndex{$0.id == idx}
        guard let todoIndex = todoIndex else{
            return
        }
        todos[todoIndex].is_completed = !todos[todoIndex].is_completed
    }
    
    func removeTodo(idx:UUID){
        let todoIndex = todos.firstIndex{$0.id == idx}
        guard let todoIndex = todoIndex else{
            return
        }
        todos.remove(at: todoIndex)
    }
}
