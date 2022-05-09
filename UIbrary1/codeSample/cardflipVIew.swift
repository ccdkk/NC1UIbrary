//
//  cardflipVIew.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/04.
//

import SwiftUI

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image("front")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .foregroundColor(.red)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image("back")
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .foregroundColor(.red)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct ContentView: View {
    //MARK: Variables
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false
    
    let width : CGFloat = 300
    let height : CGFloat = 350
    let durationAndDelay : CGFloat = 0.3
    
    //MARK: Flip Card Function
    func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        ZStack {
            CardFront(width: width, height: height, degree: $frontDegree)
            CardBack(width: width, height: height, degree: $backDegree)
        }.onTapGesture {
            flipCard ()
        }
    }
}

struct ConetentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
