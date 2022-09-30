//
//  TodoDetail.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

struct TodoDetail: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var todo: Todo
    
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading) {
                    if editMode?.wrappedValue == .inactive {
                            Text(todo.desc)
                    } else {
                        TextEditor(text: $todo.desc)
                            .onAppear {
                                update()
                            }
                            .onDisappear {
                                dismiss()
                            }
                    }
                }
                Spacer()
            }
        }
        .padding()
        .toolbar {
            EditButton()
        }
    }
}


// MARK: - Actions
extension TodoDetail {
    func update() {
        if let item = todo.thaw() {
            try? item.realm?.write {
                item.dateUpdated = Date()
            }
        }
    }
}


struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail(todo: Todo())
    }
}
