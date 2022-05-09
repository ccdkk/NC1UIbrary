//
//  ContentView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/01.
//

import SwiftUI

extension Color {
    static let lightGray = Color("lightGray")
    static let darkGray = Color("darkGray")
    static let background = Color("background")
    static let aniNameTag = Color("aniNameTag")
    static let componentTag = Color("componentTag")
    static let effectTag = Color("effectTag")
    static let triggerTag = Color("triggerTag")
}

struct MainView: View {
    
    @State private var isSearch :Bool = false
    @State private var processedData: [String] = []


    var body: some View {
        ZStack{
            Color.background
                .ignoresSafeArea()
            VStack{
                HStack(spacing:10){
                    //                    SearchButton(isSearch: $isSearch)
                    NavigationLink(destination: SearchView())
                    {SearchButton()
                    }
                    NavigationLink(destination: addPostView())
                    {
                        Image(systemName: "plus.app")
                            .resizable()
                            .frame(width:30,height:30)
                            .foregroundColor(.darkGray)
                    }
                }
                List{
                    ForEach(componentList, id: \.self){ element in
                        NavigationLink(destination: GridView1(processedData: [element])){
                            Text(element)
                        }
                    }
                }
            }
            .navigationBarTitle("UIbrary", displayMode: .inline)
            
            //            if isSearch == true {
            //                SearchView()
            //                    .transition(.move(edge: .top))
            //                    .animation(Animation.default)
            
        }
    }
//    func appendList(element1: String) -> [String] {
//        processedData.insert(element1, at: <#T##Int#>)
//        print(processedData)
//
//        return processedData
//    }
}


struct SearchButton: View{
    var body: some View{
        NavigationLink(destination:SearchView())
        {
            ZStack{
                Rectangle()
                    .frame(width: 330, height: 30)
                    .foregroundColor(.lightGray)
                    .cornerRadius(6)
                HStack{
                    Image(systemName:"magnifyingglass")
                    Text("Search")
                }
                .foregroundColor(.darkGray)
                .offset(x:-100)
            }
        }
    }
}


// modal 형식
//struct SearchButton: View{
//    @Binding var isSearch: Bool
//    var body: some View{
//        Button(action:{
//            isSearch = true
//        }) {
//            ZStack{
//                Rectangle()
//                    .frame(width: 300, height: 30)
//                    .foregroundColor(.lightGray)
//                    .cornerRadius(6)
//                HStack{
//                    Image(systemName:"magnifyingglass")
//                    Text("Search")
//                }
//                .foregroundColor(.darkGray)
//                .offset(x:-100)
//            }
//        }
//    }
//}





struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
