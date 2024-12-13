//
//  TimerModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 12.12.24.
//
import Foundation

struct myTimer: Identifiable, Codable, Equatable {
    let duration: String
    let name: String
    let id: UUID
    var remainingTime: Int
    let initialTime: Int
    var timerHistory: [TimerHistoryEntry] = []
}
