//
//  ContentView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUI

struct MainView: View {
    @AppStorage("timers") private var timersData: Data = Data()
    @State private var timers: [myTimer] = []
    @State private var timerName: String = ""
    @State private var hour: Int = 0
    @State private var minute: Int = 0
    @State private var second: Int = 0
    
    init() {
        if let decodedTimers = try? JSONDecoder().decode([myTimer].self, from: timersData) {
            _timers = State(initialValue: decodedTimers)
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            ZStack {
                VStack {
                    Text("ტაიმერები")
                        .textModifier(color: .white, weight: .bold, size: 24)
                        .padding(.trailing, 220)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 108)
            .background(darkGray)
            .padding(.top, 20)
            .ignoresSafeArea()
            
            ScrollView {
                LazyVStack {
                    ForEach(timers, id: \.id) { timer in
                        TimerView(timer: timer, timers: $timers)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: .infinity)
            .background(backGroundColor)
            
            AddTimerView(timerName: $timerName, hour: $hour, minute: $minute, second: $second, timers: $timers, timersData: $timersData)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backGroundColor)
        .ignoresSafeArea()
    }
}

struct AddTimerView: View {
    
    @Binding var timerName: String
    @Binding var hour: Int
    @Binding var minute: Int
    @Binding var second: Int
    @Binding var timers: [myTimer]
    @Binding var timersData: Data
    var placeholder: String = "ტაიმერის სახელი..."
    
    var body: some View {
        ZStack {
            darkGray
            
            VStack(spacing: 5) {
                TextField("", text: $timerName, prompt: Text(placeholder).foregroundColor(lightGrayText))
                    .frame(height: 39)
                    .frame(width: 350)
                    .textModifier(color: lightGrayText, weight: .regular, size: 12)
                    .padding(.leading, 12)
                    .background(lightGray)
                    .cornerRadius(4)
                    .padding(.top, 20)
                
                HStack(spacing: 15) {
                    TextFieldView(timerDuration: $hour, prompt: "სთ")
                    TextFieldView(timerDuration: $minute, prompt: "წთ")
                    TextFieldView(timerDuration: $second, prompt: "წმ")
                }
                .padding()
                
                Button("დამატება") {
                    let duration = "\(hour):\(minute):\(second)"
                    let totalSeconds = (hour * 3600) + (minute * 60) + second
                    let newTimer = myTimer(duration: duration, name: timerName, id: UUID(), remainingTime: totalSeconds, initialTime: totalSeconds)
                    timers.append(newTimer)
                    resetFields()
                }
                .frame(width: 155, height: 42)
                .background(addButtonColor)
                .cornerRadius(8)
                .padding(.bottom, 25)
                .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 191)
        .ignoresSafeArea()
        .onChange(of: timers) { newTimers in
            saveTimers(newTimers)
        }
    }
    
    private func resetFields() {
        hour = 0
        minute = 0
        second = 0
        timerName = ""
    }
    
    private func saveTimers(_ timers: [myTimer]) {
        if let encodedTimers = try? JSONEncoder().encode(timers) {
            timersData = encodedTimers
        }
    }
}

#Preview {
    MainView()
}
