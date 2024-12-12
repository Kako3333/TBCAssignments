//
//  TimerView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUI
import AudioToolbox

struct TimerView: View {
    
    let timer: myTimer
    @Binding var timers: [myTimer]
    @State private var isRunning = false
    @State private var timerPublisher: Timer?
    
    private var startBtnColor: Color {
        isRunning ? pauseButtonColor : startButtonColor
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 220) {
                Text(timer.name)
                    .textModifier(color: .white, weight: .regular, size: 18)
                    .padding(.top, 10)
                Button(action: {
                    deleteTimer()
                }) {
                    Image("deleteBtn")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .frame(width: 24, height: 24)
            }
            Text(formatTime(timer.remainingTime))
                .textModifier(color: addButtonColor, weight: .bold, size: 36)
            
            HStack(spacing: 10) {
                
                Button(isRunning ? "პაუზა" : "დაწყება") {
                    if isRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                    isRunning.toggle()
                }
                .frame(width: 110, height: 39)
                .background(startBtnColor)
                .cornerRadius(8)
                .padding(.bottom, 20)
                .foregroundColor(.white)
                
                Button("გადატვირთვა") {
                    resetTimer()
                }
                .frame(width: 157, height: 39)
                .background(resetButtonColor)
                .cornerRadius(8)
                .padding(.bottom, 20)
                .foregroundColor(.white)
            }
        }
        .frame(width: 360, height: 177)
        .background(darkGray)
        .cornerRadius(16)
        .padding()
    }
    
    private func startTimer() {
        timerPublisher = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if let index = timers.firstIndex(where: { $0.id == timer.id }) {
                if timers[index].remainingTime > 0 {
                    timers[index].remainingTime -= 1
                } else {
                    stopTimer()
                    timerEnded()
                }
            }
        }
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
