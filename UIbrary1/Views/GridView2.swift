//
//GridView2.swift
//UIbrary1
//
//Created by 최동권 on 2022/05/03.


import SwiftUI

struct GridView2: View {
    @State private var showingSheet:Bool = false
    
    let rowCount: Int = 1
    let gridSpacing: CGFloat = 16.0
    
    var body: some View {
        VStack {
            HStack(spacing:10){
                SearchButton()
                NavigationLink(destination: EmptyView())
                {
                    Image(systemName: "plus.app")
                        .resizable()
                        .frame(width:30,height:30)
                        .foregroundColor(.darkGray)
                }
            }
            // 인기
            ScrollView{
                VStack{
                    HStack{
                        NavigationLink(destination: EmptyView())
                        {
                            Text("인기")
                                .font(.title)
                        }
                        .padding()
                        Spacer()
                        
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: rowCount), spacing: gridSpacing) {
                            ForEach(contents) { content in
                                
                                Button (action:{
                                    self.showingSheet = true
                                }) {
                                    gridElement3(content: content )
                                }.sheet(isPresented: $showingSheet){
                                    NavigationView{
                                        postView(content: content)
                                            .toolbar {
                                                ToolbarItem(placement: .primaryAction) {
                                                    Button(action: {
                                                        self.showingSheet = false
                                                    }) {
                                                        Text("Done").fontWeight(.semibold)
                                                    }
                                                }
                                            }
                                    }
                                }
                                //                        }
                                .aspectRatio(0.7, contentMode: .fit)
                            }
                        }.padding(.all, 16)
                    }
                    .flipsForRightToLeftLayoutDirection(true)
                    .frame(height:300)
                }
                // 최신
                VStack{
                    HStack{
                        NavigationLink(destination: EmptyView())
                        {
                            Text("최신")
                                .font(.title)
                        }
                        .padding()
                        Spacer()
                    }
                    
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: Array(repeating: .init(.flexible(), spacing: gridSpacing), count: rowCount), spacing: gridSpacing) {
                        ForEach(contents) { content in
                            
                            NavigationLink(destination: EmptyView()) {
                                gridElement3(content: content )
                                
                            }
                            .aspectRatio(0.7,contentMode: .fill)
                        }
                    }.padding(.all, 16)
                }
                .flipsForRightToLeftLayoutDirection(true)
                .frame(height:300)
            }
        }
    }
}





struct GridView2_Previews: PreviewProvider {
    static var previews: some View {
        GridView2()
    }
}
