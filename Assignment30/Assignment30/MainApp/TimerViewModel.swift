//
//  TimerViewModel.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 12.12.24.
//
import SwiftUI
import AudioToolbox

class TimerViewModel {
    
    @Published private var isRunning = false
    @Published private var timerPublisher: Timer?
    @Binding var timers: [myTimer]
    let timer: myTimer
    
    init(timer: myTimer, timers: Binding<[myTimer]>) {
        self.timer = timer
        self._timers = timers
    }
    
    private func stopTimer() {
        timerPublisher?.invalidate()
        timerPublisher = nil
    }
    
    private func timerEnded() {
        let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
        impactFeedback.prepare()
        impactFeedback.impactOccurred()
        
        AudioServicesPlaySystemSound(1005)
    }
    
    private func resetTimer() {
        stopTimer()
        if let index = timers.firstIndex(where: { $0.id == timer.id }) {
            _ = timers[index].remainingTime
            timers[index].remainingTime = timers[index].initialTime
        }
        isRunning = false
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, secs)
    }
    
    private func deleteTimer() {
        if let index = timers.firstIndex(where: { $0.id == timer.id }) {
            timers.remove(at: index)
            saveTimers(timers)
        }
        print(timers.count)
    }
    
    private func saveTimers(_ timers: [myTimer]) {
        if let encodedTimers = try? JSONEncoder().encode(timers) {
            UserDefaults.standard.set(encodedTimers, forKey: "timers")
        }
    }
}

