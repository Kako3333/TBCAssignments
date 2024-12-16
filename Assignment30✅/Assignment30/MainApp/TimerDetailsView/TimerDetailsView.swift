//
//  TimerDetailsView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 13.12.24.
//
import SwiftUI

struct TimerDetailsView: View {
    var timer: myTimer
    @ObservedObject var viewModel: TimerViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var timerHistory: [TimerHistoryEntry]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ZStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.white)
                                .imageScale(.large)
                        }
                        .padding(.leading, 20)
                        .padding(.top, 20)
                        
                        Spacer()
                        
                        Text(timer.name)
                            .textModifier(color: .white, weight: .bold, size: 24)
                            .padding(.top, 25)
                        
                        Spacer()
                    }
                }
                .ignoresSafeArea(edges: .top)
                .frame(maxWidth: .infinity)
                .frame(height: 108)
                .background(darkGray)
                
                ZStack {
                    VStack(spacing: 20) {
                        Image("timerClock")
                            .resizable()
                            .frame(width: 44, height: 44)
                        
                        Text("ხანგრძლივობა")
                            .textModifier(color: .white, weight: .regular, size: 18)
                        
                        Text(viewModel.formatTime(Double(timer.initialTime)))
                            .textModifier(color: addButtonColor, weight: .bold, size: 36)
                    }
                    .frame(width: 350)
                    .frame(height: 180)
                    .padding(.horizontal, 0)
                }
                .background(darkGray)
                .cornerRadius(16)
                
                ZStack {
                    darkGray
                        .edgesIgnoringSafeArea(.all)
                    List {
                        Section {
                            HStack {
                                Text("დღევანდელი სესიები")
                                    .textModifier(color: lightGrayText, weight: .bold, size: 15)
                                    .padding(.leading, 5)
                                Spacer()
                                Text("\(viewModel.getSessionCount(for: timer.id)) სესია")
                                    .textModifier(color: .white, weight: .regular, size: 15)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.trailing, 5)
                            }
                            HStack {
                                Text("საშუალო ხანგრძლივობა")
                                    .textModifier(color: lightGrayText, weight: .bold, size: 15)
                                    .padding(.leading, 5)
                                Spacer()
                                Text("\(viewModel.formatTimeInGeorgian(viewModel.getAverageDuration(for: timer.id)))")
                                    .textModifier(color: .white, weight: .regular, size: 15)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.trailing, 5)
                            }
                            HStack {
                                Text("ჯამური დრო")
                                    .textModifier(color: lightGrayText, weight: .bold, size: 15)
                                    .padding(.leading, 5)
                                Spacer()
                                Text("\(viewModel.formatTimeInGeorgian(viewModel.getTotalDuration(for: timer.id)))")
                                    .textModifier(color: .white, weight: .regular, size: 15)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.trailing, 5)
                            }
                        }
                        .listRowBackground(darkGray)
                        .listRowSeparatorTint(lightGrayText)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .frame(maxHeight: .infinity)
                    .listStyle(PlainListStyle())
                }
                .frame(width: 350)
                .frame(height: 180)
                .cornerRadius(10)
                
                VStack {
                    Text("აქტივობის ისტორია")
                        .textModifier(color: .white, weight: .regular, size: 18)
                        .padding(.trailing, 145)
                    ScrollView() {
                        VStack() {
                            List {
                                ForEach(viewModel.getTimerHistoryGroupedByDate(for: timer.id).keys.sorted(), id: \.self) { date in
                                    Section(header: Text(viewModel.formatGeorgianDate(date))
                                        .textModifier(color: lightGrayText, weight: .regular, size: 14)) {
                                            
                                            ForEach(viewModel.getTimerHistoryGroupedByDate(for: timer.id)[date]!, id: \.id) { entry in
                                                TimerHistoryRow(entry: entry, viewModel: viewModel)
                                            }
                                        }
                                        .listRowBackground(backGroundColor)
                                        .listRowSeparatorTint(lightGrayText)
                                }
                            }
                            .frame(height: 275)
                            .frame(maxHeight: .infinity)
                            .listStyle(PlainListStyle())
                        }
                        .padding(.horizontal, 10)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.top, 0)
            .ignoresSafeArea(.all)
            .background(backGroundColor)
            .navigationBarBackButtonHidden(true)
            
        }
        .background(backGroundColor)
        .frame(maxHeight: .infinity)
        .ignoresSafeArea(.all)
    }
}

struct TimerHistoryRow: View {
    var entry: TimerHistoryEntry
    var viewModel: TimerViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.formatOclock(entry.date.timeIntervalSince1970))
                    .textModifier(color: .white, weight: .regular, size: 14)
                    .padding(.leading, 5)
                
                Spacer()
                
                Text(viewModel.formatTimeInMinutes(entry.duration))
                    .textModifier(color: .white, weight: .regular, size: 14)
                    .padding(.trailing, 5)
            }
        }
    }
}










