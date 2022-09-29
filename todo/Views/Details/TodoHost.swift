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
    
    @State private var draftTodo = Todo()
    
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftTodo = todo
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                TodoSummary(todo: todo)
            } else {
                TodoEditor(todo: $draftTodo)
                    .onAppear {
                        draftTodo = todo
                    }
                    .onDisappear {
//                        todo = draftTodo
                        save()
                    }
            }
        }
        .padding()
    }
}

// MARK: - Actions
extension TodoHost {
  func save() {
      try? realm.write {
        realm.add(draftTodo)
      }
      dismiss()
  }
}

struct TodoHost_Previews: PreviewProvider {
    static var previews: some View {
        TodoHost(todo: Todo())
    }
}
