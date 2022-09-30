//
//  TodoHost.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoHost: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            if editMode?.wrappedValue == .inactive {
                TodoSummary(todo: todo)
            } else {
                TodoEditor(todo: todo)
                    .onAppear {
                        if let item = todo.thaw() {
                            try? item.realm?.write {
                                item.dateUpdated = Date()
                            }
                        }
                    }
                    .onDisappear {
                        dismiss()
                    }
            }
        }
        .padding()
        .toolbar {
            EditButton()
        }
    }
}


struct TodoHost_Previews: PreviewProvider {
    static var previews: some View {
        TodoHost(todo: Todo())
    }
}
