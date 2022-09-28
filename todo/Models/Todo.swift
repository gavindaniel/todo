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
    
    func getDateString(dateIn: Date) -> String {
        let formatter = DateFormatter()
//        formatter.dateStyle = .short
//        let dateOut = formatter.string(from: dateIn)
        formatter.timeStyle = .short
        let timeOut = formatter.string(from: dateIn)
        return ("\(timeOut)")
    }
}
