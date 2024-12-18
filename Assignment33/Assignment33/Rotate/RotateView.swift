//
//  ContentView.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
import SwiftUI

struct RotateView: View {
    
    @State private var angleValue = Angle(degrees: 0)
    @State private var collectedAngle = Angle(degrees: 0)
    
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            
            Image("calculatorIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 200)
                .rotationEffect(collectedAngle + angleValue)
                .scaleEffect(scale)
                .gesture(
                    RotationGesture()
                        .onChanged { angle in
                            angleValue = angle
                        }
                        .onEnded { angle in
                            collectedAngle += angle
                            angleValue = .zero
                        }
                )
                .simultaneousGesture (
                    MagnificationGesture()
                        .onChanged { value in
                            scale = value
                        }
                        .onEnded { value in
                            scale = max(1.0, min(scale, 3.0))  
                        }
                )
        }
        .padding(.bottom)
    }
}

#Preview {
    RotateView()
}


