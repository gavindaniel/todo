//
//  TodoSummary.swift
//  todo
//
//  Created by Gavin Daniel on 9/28/22.
//

import SwiftUI

struct TodoSummary: View {
    var todo: Todo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(todo.desc)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct TodoSummary_Previews: PreviewProvider {
    static var previews: some View {
        TodoSummary(todo: Todo())
    }
}
