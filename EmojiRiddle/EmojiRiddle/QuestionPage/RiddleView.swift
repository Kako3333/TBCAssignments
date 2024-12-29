//
//  RiddleView.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import SwiftUI

struct RiddleView: View {
    @StateObject private var viewModel: RiddleViewModel
    @State private var showWinAnimation = false
    @State private var showLoseAnimation = false
    
    init(riddles: [Riddle], category: String) {
        _viewModel = StateObject(wrappedValue: RiddleViewModel(riddles: riddles, category: category))
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    ZStack {
                        Text("Your score: \(viewModel.score) / 10")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(8)
                    }
                    .background(.white)
                    .cornerRadius(12)
                    
                    Spacer()
                    
                    ZStack {
                        Button("Reset Riddle") {
                            viewModel.resetQuiz()
                        }
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .padding(8)
                    }
                    .background(.white)
                    .cornerRadius(12)
                }
                
                HStack {
                    ZStack {
                        Text("Question \(viewModel.questionCount + 1)/10")
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                            .padding(8)
                    }
                    .background(.white)
                    .cornerRadius(12)
                    
                    Spacer()
                }
                
                Text(viewModel.currentRiddle.emojis)
                    .font(.system(size: 50))
                    .padding()
                
                Text("What does this represent?")
                    .font(.title2)
                    .foregroundColor(.white)
                    .bold()
                
                VStack(spacing: 15) {
                    ForEach(viewModel.currentRiddle.options, id: \.self) { option in
                        Button(action: {
                            viewModel.selectedAnswer = option
                            viewModel.handleAnswer(option)
                        }) {
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    viewModel.answerCorrect == nil ? Color.white :
                                        (viewModel.selectedAnswer == option && viewModel.answerCorrect == true ? Color.green :
                                            (viewModel.selectedAnswer == option && viewModel.answerCorrect == false ? Color.red : Color.white))
                                )
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .font(.body)
                        }
                        .disabled(viewModel.areButtonsDisabled)
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert) {
                Alert(
                    title: Text("Quiz Completed!"),
                    message: Text("Your final score is \(viewModel.score) out of 10."),
                    dismissButton: .default(Text("OK"), action: showResultAnimation)
                )
            }
            .background(Color.red.ignoresSafeArea())
            
            if showWinAnimation {
                WinningAnimationView()
                    .transition(.scale)
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            if showLoseAnimation {
                LosingAnimationView()
                    .transition(.scale)
                    .ignoresSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    private func showResultAnimation() {
        if viewModel.score >= 8 {
            withAnimation {
                showWinAnimation = true
            }
        } else {
            withAnimation {
                showLoseAnimation = true
            }
        }
    }
}

