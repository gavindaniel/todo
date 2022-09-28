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
                ForEach(completedTodos) { todo in
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
