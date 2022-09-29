//
//  Todo.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

class Todo: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var dateCreated = Date()
    @Persisted var dateUpdated = Date()
    @Persisted var dateCompleted = Date()
    @Persisted var desc = ""
    @Persisted var completed = false
    
    func getDateString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let string = formatter.string(from: date)
        return string
    }
}
