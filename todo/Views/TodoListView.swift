//
//  TodoListView.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    @State private var todoFormIsPresented = false
    @Environment(\.realm) var realm
    
    @ObservedResults(
        Todo.self,
        where: { $0.completed == false }
    ) var todos
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos) { todo in
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
              TodoFormView(todo: Todo())
            }
            .padding()
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
