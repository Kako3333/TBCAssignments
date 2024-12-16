//
//  HistoryModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 13.12.24.
//
import Foundation

struct TimerHistoryEntry: Codable, Equatable {
    var date: Date
    var duration: TimeInterval
    var id = UUID()
}
