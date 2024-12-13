//
//  TimerViewModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 12.12.24.
//
import SwiftUI
import AudioToolbox

class TimerViewModel: ObservableObject {
    
    @Published var timers: [myTimer]
    @Published var timerHistories: [UUID: [TimerHistoryEntry]] = [:]
    @Published private var isRunning = false
    @Published private var timerPublisher: Timer?
    @Published private var startTime: Date? = nil
    @Published private var endTime: Date? = nil
    
    let timer: myTimer
    
    init(timers: [myTimer], timer: myTimer) {
        self.timers = timers
        self.timer = timer
        loadTimerHistories()
    }
    
    func logTimerHistory(timer: myTimer) {
        if let startTime = startTime, let endTime = endTime {
            let elapsedDuration = endTime.timeIntervalSince(startTime)
            let entry = TimerHistoryEntry(date: Date(), duration: elapsedDuration)
            
            if timerHistories[timer.id] == nil {
                timerHistories[timer.id] = []
            }
            
            timerHistories[timer.id]?.insert(entry, at: 0)
            saveTimerHistories()
        }
    }
    
//    func getTimerHistory(for timerID: UUID) -> [TimerHistoryEntry] {
//        return timerHistories[timerID] ?? []
//    }
    
    func getTimerHistory() -> [TimerHistoryEntry] {
      return timerHistories.values.flatMap { $0 }
    }
    
    func loadTimerHistories() {
        if let data = UserDefaults.standard.data(forKey: "timerHistories"),
           let decodedHistories = try? JSONDecoder().decode([UUID: [TimerHistoryEntry]].self, from: data) {
            timerHistories = decodedHistories
            print("Loaded histories: \(timerHistories)")
        } else {
            print("No histories found.")
        }
    }
    
    func deleteTimerHistory(for timerID: UUID) {
        timerHistories[timerID] = nil
        saveTimerHistories()
    }
    
    func saveTimerHistories() {
        if let encodedHistories = try? JSONEncoder().encode(timerHistories) {
            UserDefaults.standard.set(encodedHistories, forKey: "timerHistories")
        }
    }
    
    func startTimer(timers: Binding<[myTimer]>, timer: myTimer, isRunning: Binding<Bool>) {
        startTime = Date()
        timerPublisher = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if let index = timers.wrappedValue.firstIndex(where: { $0.id == timer.id }) {
                if timers.wrappedValue[index].remainingTime > 0 {
                    timers.wrappedValue[index].remainingTime -= 1
                } else {
                    self.stopTimer(isRunning: isRunning)
                    self.timerEnded()
                }
            }
        }
    }
    
    func stopTimer(isRunning: Binding<Bool>) {
        timerPublisher?.invalidate()
        timerPublisher = nil
        isRunning.wrappedValue = false
        endTime = Date()
        
        logTimerHistory(timer: timer)
    }
    
    func resetTimer(timers: Binding<[myTimer]>, timer: myTimer, isRunning: Binding<Bool>) {
        stopTimer(isRunning: isRunning)
        if let index = timers.wrappedValue.firstIndex(where: { $0.id == timer.id }) {
            timers.wrappedValue[index].remainingTime = timers.wrappedValue[index].initialTime
        }
        isRunning.wrappedValue = false
    }
    
    func deleteTimer(timers: Binding<[myTimer]>, timer: myTimer) {
        if let index = timers.wrappedValue.firstIndex(where: { $0.id == timer.id }) {
            timers.wrappedValue.remove(at: index)
            saveTimers(timers.wrappedValue)
            deleteTimerHistory(for: timer.id)
        }
    }
    
    func formatGeorgianDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ka_GE")
        dateFormatter.dateFormat = "d MMM"
        return dateFormatter.string(from: date)
    }
    
    func formatTime(_ seconds: Double) -> String {
        let hours = Int(seconds) / 3600
        let minutes = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
    
    func saveTimers(_ timers: [myTimer]) {
        if let encodedTimers = try? JSONEncoder().encode(timers) {
            UserDefaults.standard.set(encodedTimers, forKey: "timers")
        }
    }
    
    func timerEnded() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        AudioServicesPlaySystemSound(1005)
        logTimerHistory(timer: timer)
    }
}
