//
//  ListView.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-14.
//

// MVVM Architecture

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn)) 
            } else {
                // It's in a NavigationView !!
                List{
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item) //item is string here
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.1)){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
        //            .onDelete(perform: {indexSet in items.remove(atOffsets: indexSet)})
                    .onDelete(perform: listViewModel.deleteItem) // automatically sent the index??
                    .onMove(perform: listViewModel.moveItem)  // EditButton 누른 후, 리스트 위치 이동가능하게 함
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(), // onDelete를 List에 추가했더니 누르니까 delete창이뜸
            trailing: NavigationLink("Add", destination: AddView())
        )        
    }        
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{ //TodoList_App 최상위에서 줬지만 프리뷰를 하기 위해서는 여기서 따로 줘야하는거 같음
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
