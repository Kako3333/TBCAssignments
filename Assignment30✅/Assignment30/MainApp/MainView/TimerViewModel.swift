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
    
    
    init(timers: [myTimer]) {
        self.timers = timers
        loadTimerHistories()
    }
    
    func logTimerHistory(timer: myTimer) {
        if let startTime = startTime, let endTime = endTime {
            let elapsedDuration = endTime.timeIntervalSince(startTime)
            let entry = TimerHistoryEntry(date: Date(), duration: elapsedDuration)
            
            if timerHistories[timer.id] == nil {
                timerHistories[timer.id] = []
            }
            print("TimerId \(timer.id)")
            timerHistories[timer.id]?.insert(entry, at: 0)
            saveTimerHistories()
        }
    }
    
    func getSessionCount(for timerID: UUID) -> Int {
        return timerHistories[timerID]?.count ?? 0
    }
    
    func getAverageDuration(for timerID: UUID) -> Double {
        guard let histories = timerHistories[timerID], !histories.isEmpty else {
            return 0.0
        }
        let totalDuration = histories.reduce(0.0) { $0 + $1.duration }
        let averageDuration = totalDuration / Double(histories.count)
        return averageDuration
    }
    
    func getTotalDuration(for timerID: UUID) -> Double {
        guard let histories = timerHistories[timerID], !histories.isEmpty else {
            return 0.0
        }
        let totalDuration = histories.reduce(0.0) { $0 + $1.duration }
        return totalDuration
    }
    
    func getTimerHistoryGroupedByDate(for timerId: UUID) -> [Date: [TimerHistoryEntry]] {
        let history = getTimerHistory(for: timerId)
        return Dictionary(grouping: history, by: { Calendar.current.startOfDay(for: $0.date) })
    }
    
    func getTimerHistory(for timerID: UUID) -> [TimerHistoryEntry] {
        return timerHistories[timerID] ?? []
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
                    self.stopTimer(isRunning: isRunning, timer: timer)
                    self.timerEnded(timer: timer)
                }
            }
        }
    }
    
    func stopTimer(isRunning: Binding<Bool>, timer: myTimer) {
        timerPublisher?.invalidate()
        timerPublisher = nil
        isRunning.wrappedValue = false
        endTime = Date()
        
        logTimerHistory(timer: timer)
    }
    
    func resetTimer(timers: Binding<[myTimer]>, timer: myTimer, isRunning: Binding<Bool>) {
        stopTimer(isRunning: isRunning, timer: timer)
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
    
    func saveTimers(_ timers: [myTimer]) {
        if let encodedTimers = try? JSONEncoder().encode(timers) {
            UserDefaults.standard.set(encodedTimers, forKey: "timers")
        }
    }
    
    func timerEnded(timer: myTimer) {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        AudioServicesPlaySystemSound(1005)
        logTimerHistory(timer: timer)
    }
    
    
    // MARK: Formatters
    func formatGeorgianDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ka_GE")
        dateFormatter.dateFormat = "d MMM Y"
        return dateFormatter.string(from: date)
    }
    
    func formatTime(_ seconds: Double) -> String {
        let hours = Int(seconds) / 3600
        let minutes = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
    
    func formatOclock(_ timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: date)
    }
    
    func formatTimeInMinutes(_ seconds: Double) -> String {
        let minutes = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
    
    func formatTimeInGeorgian(_ seconds: Double) -> String {
        let hours = Int(seconds) / 3600
        let minutes = (Int(seconds) % 3600) / 60
        let secs = Int(seconds) % 60
        var components: [String] = []
        
        if hours > 0 {
            components.append("\(hours) საათი")
        }
        if minutes > 0 {
            components.append("\(minutes) წუთი")
        }
        if secs > 0 {
            components.append("\(secs) წამი")
        }
        return components.joined(separator: " ")
    }
}
