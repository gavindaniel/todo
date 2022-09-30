//
//  ContentView.swift
//  todo
//
//  Created by Gavin Daniel on 9/27/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case completed
    }
    
    var body: some View {
        TabView(selection: $selection) {
            TodoList()
                .tabItem {
                    Label("To-Do", systemImage: "list.bullet")
                }
                .tag(Tab.home)
            CompletedList()
                .tabItem {
                   Label("Completed", systemImage: "checklist")
                }
                .tag(Tab.completed)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
