//
//  TodoRow.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoRow: View {
    @State private var todoFormIsPresented = false
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(todo.desc)
                .lineLimit(3)
            if todo.completed { Text(todo.getDateString(dateIn: todo.dateCompleted)) }
            else { Text(todo.getDateString(dateIn: todo.dateUpdated)) }
            
        }
    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo())
    }
}
