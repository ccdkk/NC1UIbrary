//
//  postView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/03.
//

import SwiftUI


struct postView: View {
    
    var content: Content
    @State private var text = "var body some view"
    
    
    var body: some View {
        ScrollView{
            VStack{
                Text(content.title)
                    .font(.title)
                    .padding()
                
                GeometryReader { geometry in
                    TestWrappedLayout(platforms: content.tags, geometry: geometry )
                }
                .offset(x: 30)
                
                GifImage("cardflipVideo")
                    .frame(width:200, height:450)
                    .scaledToFill()
                    .offset(y:30)
                    .padding()
                
                
                
                
                
                ZStack {
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Text("ZStack").foregroundColor(.red) + Text(" {")
                        }
                        .padding([.top], 50)
                        .offset(x:-90)
                        HStack{
                            Text("CardFront").foregroundColor(.green) + Text("(") + Text("width").foregroundColor(.blue) + Text(": ") + Text("width").foregroundColor(.blue) + Text(", ") + Text("height").foregroundColor(.blue) + Text(": ") + Text("height").foregroundColor(.blue) + Text(")" )
                        }.offset(x: 100)
                        HStack{
                            Text("CardBack").foregroundColor(.green) + Text("(") + Text("width").foregroundColor(.blue) + Text(": ") + Text("width").foregroundColor(.blue) + Text(", ") + Text("height").foregroundColor(.blue) + Text(": ") + Text("height").foregroundColor(.blue) + Text(")" )
                        }.offset(x: 100)
                        HStack{
                            Text("}.") + Text("onTapGesture").foregroundColor(.purple) + Text(" {")
                        }.offset(x:5)
                        HStack{
                            Text("flipCard").foregroundColor(.orange) + Text(" ()")
                        }.offset(x:15)
                        Text("}")
                            .padding(.bottom)
                            .offset(x:-55)
                    }
                    .background(Color.lightGray)
                    .cornerRadius(10)
                    .shadow(radius: 2.0)
                    .padding()
                    
                    HStack {
                        Text("Code")
                            .font(.title3)
                            .padding()
                            .offset(x:-5)
                        
                        Spacer()
                            .frame(width:230)
                        Button(action:{
                            
                        }) {
                            Image(systemName: "square.on.square")
                        }
                    }
                    .offset(y:-70)
                    .padding()
                    
                }
                
            }
            .offset(y:-50)
        }
    }
}

struct postView_Previews: PreviewProvider {
    static var previews: some View {
        postView(content: Content(thumbNail: "test", video: "", title: "how to make card flip animation", tags: ["card flip", "Image", "Flip", "Tap"], code: "~~"))
    }
}
