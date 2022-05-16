//
//  addPostView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/03.
//

import SwiftUI

struct addPostView: View {
    
    // tags, title, link 관련
    @State private var addTitle: String = ""
    @State private var addLink: String = ""
    @State private var animationName: String = ""
    @State private var componentName: String = ""
    @State private var effectName: String = ""
    @State private var triggerName: String = ""
    
    //    @State private var isComponent: Bool = false
    //    @State private var isEffect: Bool = false
    //    @State private var isTrigger: Bool = false
    
    // picker 관련
    @State private var selectedComponent = Components.없음
    @State private var selectedEffect = Effects.없음
    @State private var selectedTrigger = Triggers.없음
    
    // 사진 목록관련 property
    @State private var showPhotoLibrary = false // 사진 목록
    @State private var image = UIImage() // 선택된 사진을 담을 곳
    @State private var gifImage: Image = Image(systemName: "camera.fill") // 프로필 사진
    
    @State private var showingAlert: Bool = false
    
    var body: some View {
        List{
            // Title & Link
            TextField("Title *", text: $addTitle)
            TextField("Link", text: $addLink)
            HStack(spacing:10){
                
                // thumbnail & video
                // gif로 대체할 경우 thumbnail이 필요 없음
                
                VStack{
                    Text("GIF")
                        .font(.title3)
                    Button(action:{
                        showPhotoLibrary.toggle()
                    }) {
                        gifImage
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: gifwidth(),height: gifheight())
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                                    .frame(width: 70, height: 70))
                            .padding()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .sheet(isPresented: $showPhotoLibrary) { // 사진 목록
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $image, gifImage: $gifImage)
                    }
                }
              
                Spacer()
            }
            .padding()
            
            //Tags
            HStack {
                Text("Tags")
                    .font(.title3)
                    .padding()
                Spacer()
            }
            .listRowSeparator(.hidden)
            HStack{
                VStack(alignment:.leading) {
                    Text("Animation name")
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    TextField("", text: $animationName)
                        .textFieldStyle(.roundedBorder)
                        .frame(width:171)
                }
                VStack(alignment:.leading){
                    
                    HStack {
                        Text("Compoent")
                            .font(.system(size: 10))
                        .foregroundColor(.gray)
                        Text("*")
                            .font(.system(size: 15))
                            .foregroundColor(Color.compulsory)
                        
                    }
                    if selectedComponent == Components.직접입력 {
                        ZStack {
                            TextField("", text: $componentName)
                                .textFieldStyle(.roundedBorder)
                            Button(action:{
                                selectedComponent = Components.Text
                                componentName = ""
                            }) {Text("pick")}
                                .font(.system(size: 10))
                                .foregroundColor(.blue)
                                .offset(x:65)
                        }
                    } else {
                        Picker("Component", selection: $selectedComponent) {
                            ForEach(Components.allCases) { component in
                                Text(component.rawValue)
                                    .tag(component)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width:171, height:33)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.lightGray,lineWidth: 0.5))
                        
                        
                    }
                }
                
            }
            .listRowSeparator(.hidden)
            
            // Effect & Trigger
            
            HStack{
                VStack(alignment:.leading){
                    HStack {
                        Text("Effect")
                            .font(.system(size: 10))
                        .foregroundColor(.gray)
                        Text("*")
                            .font(.system(size: 15))
                            .foregroundColor(Color.compulsory)
                    }
                    if selectedEffect == Effects.직접입력 {
                        ZStack {
                            TextField("", text: $effectName)
                                .textFieldStyle(.roundedBorder)
                            Button(action:{
                                selectedEffect = Effects.Move
                                effectName = ""
                            }) {Text("pick")}
                                .font(.system(size: 10))
                                .foregroundColor(.blue)
                                .offset(x:65)
                        }
                    } else {
                        Picker("Trigger", selection: $selectedEffect) {
                            ForEach(Effects.allCases) { effect in
                                Text(effect.rawValue)
                                    .tag(effect)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width:171, height:33)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.lightGray,lineWidth: 0.5))
                    }
                }
                VStack(alignment:.leading){
                    HStack {
                        Text("Trigger")
                            .font(.system(size: 10))
                        .foregroundColor(.gray)
                        Text("*")
                            .font(.system(size: 15))
                            .foregroundColor(Color.compulsory)
                    }
                    if selectedTrigger == Triggers.직접입력 {
                        ZStack {
                            TextField("", text: $triggerName)
                                .textFieldStyle(.roundedBorder)
                            Button(action:{
                                selectedTrigger = Triggers.Tap
                                triggerName = ""
                            }) {Text("pick")}
                                .font(.system(size: 10))
                                .foregroundColor(.blue)
                                .offset(x:65)
                        }
                    } else {
                        Picker("Trigger", selection: $selectedTrigger) {
                            ForEach(Triggers.allCases) { trigger in
                                Text(trigger.rawValue)
                                    .tag(trigger)
                            }
                        }
                        .pickerStyle(.menu)
                        .frame(width:171, height:33)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.lightGray,lineWidth: 0.5))
                    }
                }
            }
            .listRowSeparator(.hidden)
            
            VStack{
                HStack {
                    Text("Code")
                        .font(.title3)
                        .padding()
                    Spacer()
                }
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color.lightGray)
                    .frame(height:300)
                    .shadow(radius: 2)
            }
            
        }
        .listStyle(.plain)
        .navigationTitle("글쓰기")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingAlert.toggle()
                }) {
                    Image(systemName: "paperplane.fill")
                        .frame(width:30, height:30)
                }
            }
        }
    }
}

extension addPostView {
    
    func gifwidth() -> CGFloat {
        if gifImage == Image(systemName: "camera.fill") {
            return 40
        } else {
            return 60
        }
    }
    
    func gifheight() -> CGFloat {
        if gifImage == Image(systemName: "camera.fill") {
            return 35
        } else {
            return 60
        }
    }
}

// 전송 버튼 기능
//private extension addPostView {
//    func addPost() {
//        // 빈 칸으로 놓여진 animation name을 한 번 거른 후 func를 실행 해야 tags에 담길듯
//
//        contents.append(Content(thumbNail: "", video: "", title: addTitle, tags: [], code: <#T##String#>))
//    }
//}

//struct addPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        addPostView(profileImage: .constant(Image("front")))
//    }
//}
