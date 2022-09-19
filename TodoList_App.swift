//
//  todoList_appApp.swift
//  todoList_app
//
//  Created by 안민규 on 2022-09-14.
//

import SwiftUI

@main
struct TodoList_App: App {
    
    // to observe
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{ // It is like BrowserRouter in React
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // IPad 스타일은 달라서 이렇게 해줘야 똑같이 됨
            .environmentObject(listViewModel) // to allow all child components can use the ListViewModel
        }
    }
}
