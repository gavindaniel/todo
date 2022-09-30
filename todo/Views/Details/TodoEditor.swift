//
//  TodoEditor.swift
//  todo
//
//  Created by Gavin Daniel on 9/28/22.
//

import SwiftUI
import RealmSwift

struct TodoEditor: View {
//    @Binding var todo: Todo
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        List {
            HStack {
                Text("Notes").bold()
                Divider()
                TextField("Notes", text: $todo.desc)
//                TextField("Notes", text: $todo.desc)
            }
        }
    }
}

struct TodoEditor_Previews: PreviewProvider {
    static var previews: some View {
//        TodoEditor(todo: .constant(Todo()))
        TodoEditor(todo: Todo())
    }
}
