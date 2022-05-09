//
//  cardmoveView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/04.
//

import SwiftUI

struct cardmoveView: View {
    @State private var playAnimation: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack{
                Button("scale"){
                    playAnimation.toggle()
                }
                Spacer()
            }
            if playAnimation {
                Image("back")
                    .resizable()
                //            .frame(width:playAnimation ? 300 : 100, height:400)
                    .frame(width: 300, height:500)
                    .scaledToFill()
                    .transition(AnyTransition.scale.animation(.easeInOut))
                    .onTapGesture {
                        playAnimation.toggle()
                    }
            }
        }
    }
}


struct cardmoveView_Previews: PreviewProvider {
    static var previews: some View {
        cardmoveView()
    }
}
