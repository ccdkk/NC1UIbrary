//
//  SearchView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/02.
//

import SwiftUI

struct SearchView: View {
    
    @State private var animationName: String = ""
    @State private var componentName: String = ""
    @State private var effectName: String = ""
    @State private var triggerName: String = ""
    @State private var searchWord: String = ""
    @State private var usedCode: String = ""
    
    //    @State private var isComponent: Bool = false
    //    @State private var isEffect: Bool = false
    //    @State private var isTrigger: Bool = false
    
    @State private var selectedComponent = Components.없음
    @State private var selectedEffect = Effects.없음
    @State private var selectedTrigger = Triggers.없음
    
    @State private var showingChildView = false
    
    @State private var processedData: [String] = []
    
    //    var processedData: [String] = []
    
    var body: some View {
        VStack{
            Form{
                // animation name
                Section(header: Text("animation name")) {
                    TextField("", text: $animationName)
                }
                // component
                Section(header: Text("component")) {
                    if selectedComponent == Components.직접입력 {
                        ZStack {
                            TextField("", text: $componentName)
                            Button(action:{
                                selectedComponent = Components.Text
                            }) {Text("pick")}
                                .offset(x:145)
                        }
                    } else {
                        Picker("Component", selection: $selectedComponent) {
                            ForEach(Components.allCases) { component in
                                Text(component.rawValue)
                                    .tag(component)
                            }
                        }
                    }
                }
                // effect
                Section(header: Text("effect")) {
                    if selectedEffect == Effects.직접입력 {
                        ZStack {
                            TextField("", text: $effectName)
                            Button(action:{
                                selectedEffect = Effects.Move
                            }) {Text("pick")}
                                .offset(x:145)
                        }
                    } else {
                        Picker("Effect", selection: $selectedEffect) {
                            ForEach(Effects.allCases) { effect in
                                Text(effect.rawValue)
                                    .tag(effect)
                            }
                        }
                    }
                }
                // trigger
                Section(header: Text("trigger")) {
                    if selectedTrigger == Triggers.직접입력 {
                        ZStack {
                            TextField("", text: $triggerName)
                            Button(action:{
                                selectedTrigger = Triggers.Tap
                            }) {Text("pick")}
                                .offset(x:145)
                        }
                    } else {
                        Picker("Trigger", selection: $selectedTrigger) {
                            ForEach(Triggers.allCases) { trigger in
                                Text(trigger.rawValue)
                                    .tag(trigger)
                            }
                        }
                    }
                }
                Section(header: Text("Search Word")) {
                    TextField("", text: $searchWord)
                }
                Section(header: Text("used code"),footer: VStack{
                    Spacer()
                        .frame(height:10)
                    HStack{
                        // delete all button
                        Spacer()
                        Button("Delete All", action:{deleteAll()})
                            .foregroundColor(.red)
                            .font(.system(size: 17))
                    }
                }) {
                    TextField("", text: $usedCode)
                }
            }
            NavigationLink(destination: GridView1(processedData: makeSearchData()),
                           isActive: self.$showingChildView)
            { EmptyView() }
                .frame(width: 0, height: 0)
                .disabled(true)
                .hidden()
        }
        .navigationBarItems(
            trailing:  Button(action:{
                // 검색 기능 input 데이터를 종합해서 list로 출력
                makeSearchData()
                self.showingChildView = true
            }){Text("Done").font(.system(size: 17))}
        )
        
    }
    
    func deleteAll() {
        animationName = ""
        componentName = ""
        effectName = ""
        triggerName = ""
        searchWord = ""
        usedCode = ""
        selectedComponent = Components.없음
        selectedEffect = Effects.없음
        selectedTrigger = Triggers.없음
    }
    
    func makeSearchData() -> [String] {
        //
        var rawData: [String] = [animationName, componentName, selectedComponent.rawValue, effectName, selectedEffect.rawValue, triggerName, selectedTrigger.rawValue]
        
        
        for st in rawData {
            if st != "" && st != "없음" {
                processedData.append(st)
            }
        }
        return processedData
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
