//
//  CompletedView.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct CompletedView: View {
    
    @ObservedResults(
        Todo.self,
        where: { $0.completed == true }
    ) var completedTodos
    
    var body: some View {
        NavigationView {
            List {
                if completedTodos.isEmpty {
                  Text("Complete some to-dos off the list")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
                ForEach(completedTodos.sorted(byKeyPath: "dateCompleted", ascending: false)) { todo in
                  TodoRow(todo: todo)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Completed")
        }
    }
}

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView()
    }
}
