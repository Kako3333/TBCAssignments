//
//  TextFieldView.swift
//  Assignment30
//
//  Created by Gio Kakaladze on 11.12.24.
//
import SwiftUI

struct TextFieldView: View {
    
    @Binding var timerDuration: Int
    @State private var textValue: String = ""
    var prompt: String
    
    var body: some View {
        TextField("", text: $textValue, prompt: Text(prompt).foregroundColor(lightGrayText))
            .frame(height: 39)
            .frame(width: 110)
            .textModifier(color: lightGrayText, weight: .regular, size: 12)
            .background(lightGray)
            .cornerRadius(4)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .onChange(of: textValue) { newValue in
                let filteredValue = newValue.filter { $0.isNumber }
                
                if filteredValue != newValue {
                    textValue = filteredValue
                }
                
                if let intValue = Int(filteredValue) {
                    timerDuration = intValue
                }
            }
    }
}
