//
//  TimerView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUI
import AudioToolbox

struct TimerView: View {
    
    @Binding var timer: myTimer
    @Binding var timers: [myTimer]
    @State var isRunning = false
    @ObservedObject var viewModel: TimerViewModel
    
    private var startBtnColor: Color {
        isRunning ? pauseButtonColor : startButtonColor
    }
    
    var body: some View {
    
        NavigationLink(destination: TimerDetailsView(timer:
                                                        myTimer(
                                                            duration: timer.duration,
                                                            name: timer.name,
                                                            id: timer.id,
                                                            remainingTime: timer.remainingTime,
                                                            initialTime: timer.initialTime,
                                                            timerHistory: timer.timerHistory)
                                                     
                                                     ,viewModel: viewModel, timerHistory: $timer.timerHistory)) {
            VStack {
                HStack() {
                    Text(timer.name)
                        .textModifier(color: .white, weight: .regular, size: 18)
                        .padding(.top, 10)
                        .padding(.leading, 20)
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.deleteTimer(timers: $timers, timer: timer)
                    }) {
                        Image("deleteBtn")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.trailing, 40)
                    .padding(.top, 10)
                    .frame(width: 24, height: 24)
                }
            
                Text(viewModel.formatTime(Double(timer.remainingTime)))
                    .textModifier(color: addButtonColor, weight: .bold, size: 36)
                
                HStack(spacing: 10) {
                    Button(isRunning ? "პაუზა" : "დაწყება") {
                        if isRunning {
                            viewModel.stopTimer(isRunning: $isRunning, timer: timer)
                        } else {
                            viewModel.startTimer(timers: $timers, timer: timer, isRunning: $isRunning)
                            isRunning.toggle()
                        }
                    }
                    .frame(width: 110, height: 39)
                    .background(startBtnColor)
                    .cornerRadius(8)
                    .padding(.bottom, 20)
                    .foregroundColor(.white)
                    
                    Button("გადატვირთვა") {
                        viewModel.resetTimer(timers: $timers, timer: timer, isRunning: $isRunning)
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
    }
}
