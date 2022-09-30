//
//  TodoRow.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoRow: View {
    @State private var todoEditIsPresented = false
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo.desc)
                    .lineLimit(3)
                    .padding(.bottom, 5)
                if todo.completed { Text("Completed: \(todo.getDateString(date: todo.dateCompleted))") }
                else { Text(todo.getDateString(date: todo.dateUpdated)) }
            }
            Spacer()
        }
    }
}


struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo())
    }
}
