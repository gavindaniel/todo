//
//  RealmMigrator.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI
import RealmSwift

enum RealmMigrator {
    static private func migrationBlock(
        migration: Migration,
        oldSchemaVersion: UInt64
    ) {
        if oldSchemaVersion < 1 {
            migration.enumerateObjects(
                ofType: Todo.className()
            ) { _, newObject in
                newObject?["dateCompleted"] = Date()
            }
        }
    }
    
    static var configuration: Realm.Configuration {
        Realm.Configuration(schemaVersion: 1, migrationBlock: migrationBlock)
    }
}
