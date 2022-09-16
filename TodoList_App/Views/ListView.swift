//
//  ListView.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-14.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
       ItemModel(title: "This is the First title", isCompleted: false),
       ItemModel(title: "Second title", isCompleted: true),
       ItemModel(title: "Third title", isCompleted: false)
    ]
    
    var body: some View {
        // It's in a NavigationView !!
        List{
            ForEach(items) { item in
                ListRowView(item: item) //item is string here
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
        
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ //TodoList_App 최상위에서 줬지만 프리뷰를 하기 위해서는 여기서 따로 줘야하는거 같음
            ListView()
        }
    }
}
