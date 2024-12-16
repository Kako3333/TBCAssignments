//
//  TimerModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 12.12.24.
//
import Foundation
import SwiftUI

@Observable
class myTimer: Identifiable, Codable, Equatable {
    static func == (lhs: myTimer, rhs: myTimer) -> Bool {
        lhs.id == rhs.id
    }
    
    var duration: String
    var name: String
    var id: UUID
    var remainingTime: Int
    var initialTime: Int
    var timerHistory: [TimerHistoryEntry] = []
    
    init(duration: String, name: String, id: UUID, remainingTime: Int, initialTime: Int, timerHistory: [TimerHistoryEntry]) {
        self.duration = duration
        self.name = name
        self.id = id
        self.remainingTime = remainingTime
        self.initialTime = initialTime
        self.timerHistory = timerHistory
    }
}
