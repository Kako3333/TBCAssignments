//
//  TabBarEnum.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
import Foundation

enum TabbedItems: Int, CaseIterable {
    case spin = 0
    case hold
    case rotate
    case trash

    var title: String {
        switch self {
        case .spin: return "Spin"
        case .hold: return "Hold"
        case .rotate: return "Rotate"
        case .trash: return "Trash"
        }
    }

    var iconName: String {
        switch self {
        case .spin: return "spinIcon"
        case .hold: return "holdIcon"
        case .rotate: return "rotateIcon"
        case .trash: return "trashIcon"
        }
    }
}
