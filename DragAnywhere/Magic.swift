//
//  Magic.swift
//  DragAnywhere
//
//  Created by Adam Chen JingFan on 2023/10/27.
//

import Foundation

func modifyWindowDragGesture(_ value: Bool) {
    let _ = shell("defaults write -g NSWindowShouldDragOnGesture \(value ? 1 : 0)")
}

func getWindowDragGesture() -> Bool {
    return shell("defaults read -g NSWindowShouldDragOnGesture").trimmingCharacters(in: .whitespacesAndNewlines) == "1"
}
