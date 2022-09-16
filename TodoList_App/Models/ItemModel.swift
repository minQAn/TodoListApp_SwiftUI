//
//  ItemModel.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-16.
//

import Foundation

struct ItemModel: Identifiable{ // Identifiable means “this type can be identified uniquely.”, that' why it needs ID
    let id: String = UUID().uuidString // random Universally Unique Identifiers
    let title: String
    let isCompleted: Bool
}
