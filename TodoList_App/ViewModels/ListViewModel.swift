//
//  ListViewModel.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-16.
//

import Foundation

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

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
    func updateItem(item: ItemModel){ // 여기 문법 이해 안됨 what is firstIndex? 처음 찾은 인덱스?
//        if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//        }{ // if there is no item matches, firstIndex returns nil so..
//
//        }
        
        // totally same as above 3 lines of code
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
        
    }
}
