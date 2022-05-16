//
//  RootPresentationMode.swift
//  UIbrary1
//
//  Created by 최동권 on 2022/05/16.
//

import SwiftUI

struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<RootPresentationMode> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

typealias RootPresentationMode = Bool

extension RootPresentationMode {
    
    public mutating func dismiss() {
        self.toggle()
    }
}

class PopToRoot: ObservableObject {
    @Published var popToRootBool: Bool
    
    init(popToRootBool: Bool) {
        self.popToRootBool = popToRootBool
    }
    
    deinit {
        print("PopToRoot",#function)
    }
}
