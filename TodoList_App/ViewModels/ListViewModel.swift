//
//  ListViewModel.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-16.
//

import Foundation

class ListViewModel: ObservableObject {
    
    // What is @Published?
    @Published var items: [ItemModel] = []
    
    init(){
        getItems()
    }
    
    func getItems(){
        let newItems = [
            ItemModel(title: "This is the First title", isCompleted: false),
            ItemModel(title: "Second title", isCompleted: true),
            ItemModel(title: "Third title", isCompleted: false)
         ]
        
        items.append(contentsOf: newItems) // 여러개를 추가할때는 contentsOf
    }
    
    func deleteItem (indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem(from: IndexSet, to: Int){ // 왜 from은 IndexSet 이고 to는 Int 인가요?
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
}
