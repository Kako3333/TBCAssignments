//
//  HistoryModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 13.12.24.
//
import Foundation

class TimerHistoryEntry: Codable, Equatable {
    static func == (lhs: TimerHistoryEntry, rhs: TimerHistoryEntry) -> Bool {
        lhs.id == rhs.id
    }
    
    let date: Date
    let duration: TimeInterval
    let id = UUID()
    
    init(date: Date, duration: TimeInterval) {
        self.date = date
        self.duration = duration
    }
}
