//
//  halfmodalView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/04.
//

import SwiftUI

import SwiftUI

struct halfmodalView: View {
    @State var transitionView: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack{
                Button("Open half modal") {
                    transitionView.toggle()
                }
                Spacer()
            }
            if transitionView{
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.move(edge: .bottom))
                    .animation(.easeIn)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}


struct halfmodalView_Previews: PreviewProvider {
    static var previews: some View {
        halfmodalView()
    }
}
