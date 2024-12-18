//
//  TemplateTimers.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 15.12.24.
//
import SwiftUI

let templateTimers: [myTimer] = [
    myTimer(duration: "60", name: "Warm-Up 1", id: UUID(), remainingTime: 60, initialTime: 60, timerHistory: [TimerHistoryEntry(date: Date(), duration: 60)]),
    myTimer(duration: "120", name: "Warm-Up 2", id: UUID(), remainingTime: 120, initialTime: 120, timerHistory: [TimerHistoryEntry(date: Date(), duration: 120)]),
    myTimer(duration: "180", name: "Cardio 1", id: UUID(), remainingTime: 180, initialTime: 180, timerHistory: [TimerHistoryEntry(date: Date(), duration: 180)]),
    myTimer(duration: "240", name: "Cardio 2", id: UUID(), remainingTime: 240, initialTime: 240, timerHistory: [TimerHistoryEntry(date: Date(), duration: 240)]),
    myTimer(duration: "300", name: "Resistance Training", id: UUID(), remainingTime: 300, initialTime: 300, timerHistory: [TimerHistoryEntry(date: Date(), duration: 300)]),
    myTimer(duration: "600", name: "Running on Track", id: UUID(), remainingTime: 600, initialTime: 600, timerHistory: [TimerHistoryEntry(date: Date(), duration: 600)]),
    myTimer(duration: "900", name: "Fast Exercise", id: UUID(), remainingTime: 900, initialTime: 900, timerHistory: [TimerHistoryEntry(date: Date(), duration: 900)]),
    myTimer(duration: "1500", name: "Safety Training", id: UUID(), remainingTime: 1500, initialTime: 1500, timerHistory: [TimerHistoryEntry(date: Date(), duration: 1500)]),
    myTimer(duration: "1800", name: "Intense Training", id: UUID(), remainingTime: 1800, initialTime: 1800, timerHistory: [TimerHistoryEntry(date: Date(), duration: 1800)]),
    myTimer(duration: "3600", name: "Endurance Training", id: UUID(), remainingTime: 3600, initialTime: 3600, timerHistory: [TimerHistoryEntry(date: Date(), duration: 3600)])
]
