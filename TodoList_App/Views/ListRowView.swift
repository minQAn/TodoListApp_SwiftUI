//
//  ListRowView.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-14.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel // props같은 개념인가?
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle") // ternary operator
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first test item", isCompleted: false)
    static var item2 = ItemModel(title: "second test item", isCompleted: true)
    
    static var previews: some View {
        Group{ // Group is called "Environment Modifiers". 그룹을 묶어서 한번에 꾸미고 싶을 때
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits) // to show preview with fit size, not like two separated mobile size
    }
}
