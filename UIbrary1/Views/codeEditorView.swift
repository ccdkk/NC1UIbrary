//
//  SwiftUIView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/17.
//

import SwiftUI
import CodeEditorView

struct codeEditorView: View {
    
    var content: Content
    
    @State private var text:     String                = "My awesome code..."
      @State private var position: CodeEditor.Position  = CodeEditor.Position()
      @State private var messages: Set<Located<Message>> = Set()

      @Environment(\.colorScheme) private var colorScheme: ColorScheme

      var body: some View {
        CodeEditor(text: $text, position: $position, messages: $messages, language: .swift)
          .environment(\.codeEditorTheme,
                       colorScheme == .dark ? Theme.defaultDark : Theme.defaultLight)
          .onAppear(perform: {
              text = content.code
          })
      }
}


//struct codeEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        codeEditorView()
//    }
//}
