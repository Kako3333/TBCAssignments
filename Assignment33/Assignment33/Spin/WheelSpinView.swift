//
//  SwiftUIView.swift
//  Assignment33
//
//  Created by Gio Kakaladze on 18.12.24.
//
import SwiftUI

struct WheelSpinView: View {
    @State private var rotation: Angle = .zero
    @State private var previousDragValue: CGFloat = 0

    var body: some View {
        ZStack {
            backGroundColor.edgesIgnoringSafeArea(.all)
            
            Image("wheelFill")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .rotationEffect(rotation)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let dragChange = value.translation.height - previousDragValue
                            rotation = rotation + Angle(degrees: Double(dragChange / 2))
                            previousDragValue = value.translation.height
                        }
                        .onEnded { _ in
                            previousDragValue = 0
                        }
                )
        }
        .padding(.bottom)
    }
}

#Preview {
    WheelSpinView()
}



