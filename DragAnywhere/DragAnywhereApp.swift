//
//  DragAnywhereApp.swift
//  DragAnywhere
//
//  Created by Adam Chen JingFan on 2023/10/27.
//

import SwiftUI

extension Scene {
    func windowResizabilityContentSize() -> some Scene {
        if #available(macOS 13.0, *) {
            return windowResizability(.contentSize)
        } else {
            return self
        }
    }
}

@main
struct DragAnywhereApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizabilityContentSize()
    }
}
