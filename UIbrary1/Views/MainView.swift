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
    static let compulsory = Color("compulsory")
}

struct MainView: View {
    
    @State private var isSearch :Bool = false
    @State private var processedData: [String] = []
    
    //pop to root
        @StateObject var environmentPopToRootImage: PopToRoot = PopToRoot(popToRootBool: false)
        @StateObject var environmentPopToRootText: PopToRoot = PopToRoot(popToRootBool: false)
        @StateObject var environmentPopToRootButton: PopToRoot = PopToRoot(popToRootBool: false)
        @StateObject var environmentPopToRootShape: PopToRoot = PopToRoot(popToRootBool: false)
    
//    @StateObject var environmentPopToRootList: PopToRootList = PopToRootList(popToRootBoolList: [false,false,false])
    var body: some View {
        NavigationView{
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
                            NavigationLink(destination: GridView1(processedData: [element]), isActive: popToRootElement(element).popToRootBool)
                            {
                                Text(element)
                            }
                        }
                        //                        Button("Image"){
                        //                        }
                        //                        .background(NavigationLink("image", destination: GridView1(processedData: ["Image"]),isActive: self.$environmentPopToRoot.popToRootBool)
                        //                        )
                        //
                        //                        Button("Text"){
                        //                        }
                        //                        .background(NavigationLink("Text", destination: GridView1(processedData: ["Text"]),isActive: self.$environmentPopToRoot2.popToRootBool)
                        //
                        //                        )
                    }
                }
                .navigationBarTitle("UIbrary", displayMode: .inline)
            }
        }
        .environmentObject(self.environmentPopToRootImage)
        .environmentObject(self.environmentPopToRootText)
        .environmentObject(self.environmentPopToRootButton)
        .environmentObject(self.environmentPopToRootShape)
    }
    
    func popToRootElement(_ element: String) -> ObservedObject<PopToRoot>.Wrapper {
        switch element {
        case "Image":
            return self.$environmentPopToRootImage
        case "Text":
            return self.$environmentPopToRootText
        case "Button":
            return self.$environmentPopToRootButton
        case "Shape":
            return self.$environmentPopToRootShape
        default:
            return self.$environmentPopToRootText
        }
    }
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


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
