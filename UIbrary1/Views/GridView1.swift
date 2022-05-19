//
//  GridView1.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/02.
//

import SwiftUI
import AVKit

struct GridView1: View {
    
    // grid
    private static let initialColumns = 1
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    
    @State private var showingSheet: Bool = false
//    @State private var finalData: [Content] = []
    
    @State private var isPresentingcontent: Content? = nil
    
    // data 정렬
    var processedData: [String]
    
    //pop to root
    @EnvironmentObject var environmentPopToRoot: PopToRoot
    
    
    var body: some View {
        VStack{
            HStack(spacing:10){
                SearchButton()
                NavigationLink(destination: addPostView())
                {
                    Image(systemName: "plus.app")
                        .resizable()
                        .frame(width:30,height:30)
                        .foregroundColor(.darkGray)
                }
            }
            Spacer()
                .frame(height:20)
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridColumns,spacing: 16.0) {
                    ForEach(sortedcontents()) { content in

                        //                        GeometryReader { geo in
                        Button (action:{
                            self.showingSheet = true
                            isPresentingcontent = content
                        }) {
                            gridElement(content: content )
                                .frame(height:550)
                                .padding()
                        }
                        //                        }
                        .cornerRadius(8.0)
                        .aspectRatio(0.7, contentMode: .fit)
                        // 이건 뭐지?
                        //                        let _ = print("content")
                    }
                    .sheet(item: $isPresentingcontent){ content in
                        NavigationView{  // navigationView설정은 이후에 추가할 link자리를 위해
                            postView(content: content)
                                .toolbar {
                                    ToolbarItem(placement: .primaryAction) {
                                        Button(action: {
//                                            self.showingSheet = false
                                            isPresentingcontent = nil
                                        }) {
                                            Text("Done").fontWeight(.semibold)
                                        }
                                    }
                                }
                        }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(id: "UIbrary", placement: .principal) {
                Button("UIbrary") {
                    self.environmentPopToRoot.popToRootBool.toggle()
                }
                .tint(.black)
            }
        }
        .onAppear(perform: {
                        print(processedData)
            //            print(contents)
            print(sortedcontents())
        })
    }
    func sortedcontents() -> [Content] {
        // Search 기능
        // contents를 deepcopy하여 내부를 sorted하여 copy본 return
        
        var contentsCopy: [Content] = contents
        
        for content in contentsCopy {
            var isContain: [Bool] = []
            for search in processedData {
                if content.tags.contains(search) {
                    isContain.append(true)
                }
            }
            if isContain.count != processedData.count {
                let index = contentsCopy.firstIndex(of: content)
                contentsCopy.remove(at:index!)
            }
        }
        return contentsCopy
    }
}



struct gridElement: View{
    
    var content: Content
    
    var body: some View{
        VStack{
            GifImage(content.video)
                .frame(width: 200, height: 450)
                .scaledToFill()
            VStack{
                VStack(alignment: .center) {
                    Text(content.title)
                        .font(.body)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    GeometryReader { geometry in
                        TestWrappedLayout(platforms: content.tags, geometry: geometry )
                        
                    }
                }
            }
        }
    }
}

struct gridElement2: View{
    var content: Content
    //    let size: CGFloat
    
    var body: some View{
        HStack{
            Image(content.thumbNail)
                .resizable()
                .scaledToFit()
            VStack{
                Text(content.title)
                    .font(.body)
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
                GeometryReader { geometry in
                    TestWrappedLayout(platforms: content.tags, geometry: geometry )
                    //                            .offset(x:)
                }
            }
            .offset(y:100)
        }
        .frame(height:300)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.lightGray,lineWidth: 2))
        
    }
}

struct gridElement3: View{
    var content: Content
    //    let size: CGFloat
    
    var body: some View{
        VStack{
            GifImage("cardflipVideo")
            //            Image(content.thumbNail)
            //                .resizable()
            //                .scaledToFit()
            VStack{
                Text(content.title)
                    .font(.body)
                    .foregroundColor(.black)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
                //                        .padding([.horizontal], 4)
                //                        .multilineTextAlignment(.center)
            }
            .background(Color.lightGray)
            .cornerRadius(8)
            .shadow(radius: 1, y: -0.5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.lightGray, lineWidth: 2)
        )
    }
}

// 특정 모서리에만 라운드 죽
//extension gridElement3 {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//struct RoundedCorner: Shape {
//
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}

struct GridView1_Previews: PreviewProvider {
    static var previews: some View {
        GridView1(processedData: [""])
    }
}
