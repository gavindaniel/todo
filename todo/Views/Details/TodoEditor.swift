//
//  TodoEditor.swift
//  todo
//
//  Created by Gavin Daniel on 9/28/22.
//

import SwiftUI
import RealmSwift

struct TodoEditor: View {
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        ScrollView {
            HStack {
                TextField("Notes", text: $todo.desc)
            }
        }
    }
}

struct TodoEditor_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditor(todo: Todo())
    }
}
