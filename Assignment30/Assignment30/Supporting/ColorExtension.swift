//
//  ColorExtension.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUICore
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: Double
        switch hex.count {
        case 8:
            (a, r, g, b) = (
                Double((int >> 24) & 0xFF) / 255.0,
                Double((int >> 16) & 0xFF) / 255.0,
                Double((int >> 8) & 0xFF) / 255.0,
                Double(int & 0xFF) / 255.0
            )
        case 6:
            (a, r, g, b) = (
                1.0,
                Double((int >> 16) & 0xFF) / 255.0,
                Double((int >> 8) & 0xFF) / 255.0,
                Double(int & 0xFF) / 255.0
            )
        default:
            (a, r, g, b) = (1.0, 0, 0, 0)
        }
        self.init(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
}

let backGroundColor = Color(hex: "#1E1E1E")
let darkGray = Color(hex: "#2C2C2C")
let lightGray = Color(hex: "#3A3A3C")
let addButtonColor = Color(hex: "#007AFF")
let resetButtonColor = Color(hex: "#FF3B30")
let pauseButtonColor = Color(hex: "#FF9500")
let startButtonColor = Color(hex: "#34C759")
let lightGrayText = Color(hex: "#757575")

