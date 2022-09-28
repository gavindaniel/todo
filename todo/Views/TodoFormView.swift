//
//  TodoFormView.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm

    @ObservedRealmObject var todo: Todo
    
    var isUpdating: Bool {
        todo.realm != nil
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("Notes") {
                    TextEditor(text: $todo.desc)
                }
            }
            .navigationTitle("Add To-Do List Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(isUpdating ? "Done" : "Save") {
                        if isUpdating {
                            dismiss()
                        } else {
                            save()
                        }
                    }
                    .disabled(todo.desc.isEmpty)
                }
            }
        }
    }
}

// MARK: - Actions
extension TodoFormView {
  func save() {
      try? realm.write {
        realm.add(todo)
      }
      dismiss()
  }
}

struct TodoFormView_Previews: PreviewProvider {
    static var previews: some View {
        TodoFormView(todo: Todo())
    }
}
