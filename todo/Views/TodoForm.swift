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
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $todo.desc)
            }
            .padding()
            .navigationTitle("Add To-Do List Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        save()
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
