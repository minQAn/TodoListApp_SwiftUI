//
//  ListView.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-14.
//

// MVVM Architecture

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
//            .onDelete(perform: {indexSet in items.remove(atOffsets: indexSet)})
            .onDelete(perform: deleteItem) // automatically sent the index??
            .onMove(perform: moveItem)  // EditButton 누른 후, 리스트 위치 이동가능하게 함
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(), // onDelete를 List에 추가했더니 누르니까 delete창이뜸
            trailing: NavigationLink("Add", destination: AddView())
        )
        
    }
    
    func deleteItem (indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){ // 왜 from은 IndexSet 이고 to는 Int 인가요?
        items.move(fromOffsets: from, toOffset: to)
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ //TodoList_App 최상위에서 줬지만 프리뷰를 하기 위해서는 여기서 따로 줘야하는거 같음
            ListView()
        }
    }
}
