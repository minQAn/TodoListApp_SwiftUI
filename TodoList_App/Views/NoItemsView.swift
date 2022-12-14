//
//  NoItemsView.swift
//  TodoListdoList_app
//
//  Created by Min Ku An on 2022-09-18.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor") // from Assets folder
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the add button and add a buch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something π₯³")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                .padding(.horizontal, animate ? 30: 50) // animate μνκ° μ κ³μ λ³νλκ±ΈκΉμ
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400) // for landscape mode
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onDisappear{
            animate = false //νλ©΄λκ°λ
        }
    }
    
    func addAnimation(){
        guard !animate else { return } // μ¬κΈ°κ° μ΄ν΄κ° μκ°.. μλλ©μ΄μμ κ³μ λ¬΄νλ°λ³΅νλλ°..
        
        //DispatchQueue is like setTimeout() in javascript..
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { // 1.5μ΄λ€μ μ€ν
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle() // same as animate = !animate
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
        .previewInterfaceOrientation(.portrait)
    }
}
