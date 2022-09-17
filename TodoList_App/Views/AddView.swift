//
//  AddView.swift
//  TodoListdoList_app
//
//  Created by 안민규 on 2022-09-14.
//

import SwiftUI


struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode // 파라미터가 이해 안됨
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = "" //propertyWrapper? get, set
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...", text: $textFieldText) // 앞에 $하는 이유는? bind?? wrappedValue? getter and setter? // refer: https://medium.com/harrythegreat/swift-properywrapper%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%9C-%EA%B0%92%EC%B2%98%EB%A6%AC-a8ef0d87e8e
                    // placeholder color 변경은 ZStack과 isEmpty로 하는거같음..
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1))) // edit -> format -> show colors
                    .cornerRadius(10)
                    
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖋")
        .alert(isPresented: $showAlert, content: getAlert) // isPresented가 true false를 관리하는건가?
    }
    
    func saveButtonPressed(){
        if textIsAppropriate(){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss() // back to the ListView
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😱"
            showAlert.toggle() // toggle??동작원리가?
            return false
        }
        return true
    }
               
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
