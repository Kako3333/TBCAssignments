//
//  TextModifier.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUI

struct TextModifier: ViewModifier {
    var color: Color
    var weight: Font.Weight
    var size: CGFloat

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundColor(color)
    }
}

extension View {
    func textModifier(color: Color = .primary, weight: Font.Weight = .regular, size: CGFloat = 16) -> some View {
        self.modifier(TextModifier(color: color, weight: weight, size: size))
    }
}
