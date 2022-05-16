//
//  Data.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/01.
//

import Foundation
import SwiftUI

// MainView list
let componentList: [String] = ["Image","Text","Button","Shape"]

// Picker list
enum Components: String, CaseIterable, Identifiable {
    case 없음
    case Text
    case Image
    case Button
    case Shape
    case 직접입력

    var id: String { self.rawValue }
}

enum Effects: String, CaseIterable, Identifiable {
    case 없음
    case Move
    case Opacity
    case Rotate
    case Flip
    case 직접입력

    var id: String { self.rawValue }
}

enum Triggers: String, CaseIterable, Identifiable {
    case 없음
    case Tap
    case Drag
    case Slide
    case 직접입력

    var id: String { self.rawValue }
}

// 게시물 data
struct Content: Identifiable, Equatable{
    let id = UUID()
    var thumbNail: String
    var video: String
    var title: String
    var tags: [String]
    var code: String
}

var contents: [Content] = [
Content(thumbNail: "test", video: "cardflipVideo", title: "How to make card flip animation", tags: ["Image","Card flip", "Flip", "Tap"], code: "~~"),
Content(thumbNail: "test", video: "changescale", title: "Let's make card animation with scale", tags: ["Image", "", "Pop up", "Button"], code: "~~"),
Content(thumbNail: "test", video: "halfmodal", title: "How to make half modal view", tags: ["Shape", "Half modal", "Move", "Button"], code: "~~"),
Content(thumbNail: "test", video: "cardSlide", title: "Let's make card slide!", tags: ["Image", "", "Slide horizontal", "Button"], code: "~~")
]

