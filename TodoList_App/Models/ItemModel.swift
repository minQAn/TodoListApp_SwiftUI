//
//  ItemModel.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-16.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable, Codable { // Identifiable means “this type can be identified uniquely.”, that' why it needs ID,
    // Codable: associated with decode and encode
    let id: String // random Universally Unique Identifiers
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // entity는 id, title, isCompleted는 바꿀수 없고 오로지 이곳에서 만든 함수를 통해서만 바꿀 수 있음
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


