//
//  WheelHoldView.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
import SwiftUI

struct WheelHoldView: View {
    @State private var isHolding = false
    
    let wheelFillImage = "wheelFill"
    let wheelEmptyImage = "wheelEmpty"
    
    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            
            Image(isHolding ? wheelEmptyImage : wheelFillImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onLongPressGesture(minimumDuration: 5) {
                        isHolding = true
                } onPressingChanged: {_ in 
                    isHolding = false
                }
        }
        .padding(.bottom)
    }
}

#Preview {
    WheelHoldView()
}

