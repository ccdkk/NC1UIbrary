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
        ScrollView(showsIndicators:false){
            VStack{
                Text(content.title)
                    .font(.title)
                    .padding()
                
                GeometryReader { geometry in
                    TestWrappedLayout(platforms: content.tags, geometry: geometry )
                }
                .offset(x: 30)
                
                GifImage(content.video)
                    .frame(width:200, height:450)
                    .scaledToFill()
                    .offset(y:30)
                    .padding()
                
                
                ZStack {
                    
                    codeEditorView(content: content)
                    
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
        .onAppear(perform: {
            print(content)
        })
    }
}

struct postView_Previews: PreviewProvider {
    static var previews: some View {
        postView(content: Content(thumbNail: "test", video: "", title: "how to make card flip animation", tags: ["card flip", "Image", "Flip", "Tap"], code: "~~"))
    }
}
