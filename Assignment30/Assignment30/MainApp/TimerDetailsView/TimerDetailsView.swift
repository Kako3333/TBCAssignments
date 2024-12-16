//
//  TimerDetailsView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 13.12.24.
//
import SwiftUI

struct TimerDetailsView: View {
    
    var timer: myTimer
    @Binding var timers: [myTimer]
    @ObservedObject var viewModel: TimerViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(spacing: 0) {
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
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 108)
            .background(darkGray)
            .padding(.top, 20)
            .ignoresSafeArea(edges: .all)
            
            ZStack {
                VStack(spacing: 20) {
                    Image("timerClock")
                        .resizable()
                        .frame(width: 70, height: 70)
                    
                    Text("ხანგრძლივობა")
                        .textModifier(color: .white, weight: .regular, size: 18)
                    
                    Text(viewModel.formatTime(Double(timer.initialTime)))
                        .textModifier(color: addButtonColor, weight: .bold, size: 36)
                }
                .frame(width: 360)
                .frame(height: 328)
                .padding(.horizontal, 0)
            }
            .background(darkGray)
            .padding(.top, 15)
            .cornerRadius(16)
            
            ZStack {
                ScrollView {
                    VStack(spacing: 13) {
                        
                        Text("აქტივობის ისტორია")
                            .textModifier(color: .white, weight: .regular, size: 18)
                            .padding(.trailing, 145)
                        
                        ZStack {
                            Text("")
                                .frame(height: 1)
                                .frame(width: 328)
                        }
                        .background(.white)
                        
                        HStack(spacing: 30) {
                            Text("თარიღი")
                                .textModifier(color: .white, weight: .regular, size: 14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                            
                            Spacer()
                            Spacer()
                            
                            Text("დრო")
                                .textModifier(color: .white, weight: .regular, size: 14)
                                .padding(.trailing, 20)
                        }
                        .padding(.horizontal)
                        
                        ForEach(viewModel.getTimerHistory(), id: \.id) { entry in
                            HStack {
                                Text(viewModel.formatGeorgianDate(entry.date))
                                    .textModifier(color: .white, weight: .regular, size: 16)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 20)
                                
                                Spacer()
                                Spacer()
                                
                                Text(viewModel.formatTime(Double(entry.duration)))
                                    .textModifier(color: .white, weight: .regular, size: 16)
                                    .padding(.trailing, 20)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 30)
                }
                .background(darkGray)
                .frame(width: 360)
                .frame(height: 328)
                .padding(.horizontal, 0)
                .padding(.top, 30)
                .cornerRadius(16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea(.all)
        .foregroundColor(backGroundColor)
        .background(backGroundColor)
        .navigationBarBackButtonHidden(true)
    }
}








