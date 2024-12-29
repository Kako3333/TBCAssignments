//
//  ResultAnimationsView.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import SwiftUI

struct WinningAnimationView: View {
    var body: some View {
        VStack {
            Text("You Won!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.green)
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
                .transition(.opacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
        .ignoresSafeArea()
    }
}

struct LosingAnimationView: View {
    var body: some View {
        VStack {
            Text("You Lost!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.red)
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .transition(.opacity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.8))
        .ignoresSafeArea()
    }
}
