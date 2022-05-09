//
//  GridElementView.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/03.
//

import SwiftUI

//struct ExampleTagsView: View {
//    var body: some View {
//        GeometryReader { geometry in
//            ScrollView(.vertical) {
//                VStack(alignment: .leading) {
//                    Text("Platforms:")
//                    TestWrappedLayout(geometry: geometry)
//
//                    Text("Other Platforms:")
//                    TestWrappedLayout(geometry: geometry)
//                }
//            }
//        }
//    }
//}
//
//struct ExampleTagsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleTagsView()
//    }
//}

struct TestWrappedLayout: View {
    var platforms: [String]
    let geometry: GeometryProxy

    var body: some View {
        self.generateContent(in: geometry)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.platforms, id: \.self) { platform in
                self.item(for: platform)
                    .padding([.horizontal,.vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if platform == self.platforms.first! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if platform == self.platforms.first! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
    }

    func item(for text: String) -> some View {
        Text(text)
            .padding(.all, 5)
            .font(.body)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(5)
    }
}

//
//struct GridElementView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleTagsView()
//    }
//}
