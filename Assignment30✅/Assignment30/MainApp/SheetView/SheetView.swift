//
//  SheetView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 15.12.24.
//

import SwiftUI

let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
]

struct SheetView: View {
    
    @ObservedObject var viewModel: TimerViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var timers: [myTimer]
    var timer: myTimer
    
    var body: some View {
        
        ScrollView {
            Text("სწრაფი ტაიმერები")
                .textModifier(color: .white, weight: .bold, size: 20)
                .padding(.top, 20)
                .padding(.trailing, 170)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(templateTimers, id: \.self.id) { timer in
                    VStack {
                        Text(viewModel.formatTimeInMinutes(Double(timer.duration) ?? 0.0))
                            .textModifier(color: addButtonColor, weight: .bold, size: 20)
                            .foregroundColor(.white)
                            .padding(5)
                        
                        Text(timer.name)
                            .textModifier(color: .white, weight: .regular, size: 13)
                    }
                    .frame(width: 108, height: 95)
                    .background(darkGray)
                    .cornerRadius(8)
                    .padding(5)
                    .onTapGesture {
                        if let selectedIndex = templateTimers.firstIndex(where: { $0.id == timer.id }) {
                            let selectedTimer = templateTimers[selectedIndex]
                            timers.append(selectedTimer)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                }
                
            }
            .padding()
        }
        .background(backGroundColor)
    }
}

#Preview {
    SheetView(viewModel: TimerViewModel(timers: templateTimers), timers: .constant([]), timer: templateTimers[0])
}
