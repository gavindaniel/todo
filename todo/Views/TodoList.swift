//
//  TodoList.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoList: View {
    @State private var todoFormIsPresented = false
    @Environment(\.realm) var realm
    
    @ObservedResults(
        Todo.self,
        where: { $0.completed == false }
    ) var todos
    
    var body: some View {
        NavigationView {
            List {
                if todos.isEmpty {
                  Text("Add some to-dos to the list")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                ForEach(todos.sorted(byKeyPath: "dateUpdated", ascending: false)) { todo in
                    NavigationLink {
                        TodoDetail(todo: todo)
                    } label: {
                        TodoRow(todo: todo)
                            .swipeActions {
                                Button("Complete") {
                                    if let item = todo.thaw() {
                                        try? item.realm?.write {
                                            item.completed.toggle()
                                            item.dateCompleted = Date()
                                        }
                                    }
                                }
                                .tint(.green)
                            }
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("To-Do List")
            .toolbar {
                Button {
                    todoFormIsPresented.toggle()
                } label: {
                    Label("Add To-Do Item", systemImage: "plus.circle")
                }
            }
            .sheet(isPresented: $todoFormIsPresented) {
                TodoForm(todo: Todo())
            }
            .padding()
        }
    }
}

struct TodoList_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
