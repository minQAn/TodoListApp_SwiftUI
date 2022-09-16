//
//  todoList_appApp.swift
//  todoList_app
//
//  Created by 안민규 on 2022-09-14.
//

import SwiftUI

@main
struct TodoList_App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView{ // It is like BrowserRouter in React
                ListView()
            }
        }
    }
}
