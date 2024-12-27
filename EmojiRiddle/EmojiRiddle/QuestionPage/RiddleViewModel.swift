//
//  QuestionsPageViewModel.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import Foundation
import SwiftUI

class RiddleViewModel: ObservableObject {
    @Published var questionCount: Int
    @Published var score: Int
    @Published var selectedAnswer: String? = nil
    @Published var answerCorrect: Bool? = nil
    @Published var areButtonsDisabled = false
    @Published var showAlert = false
    
    let riddles: [Riddle]
    let category: String
    
    init(riddles: [Riddle], category: String) {
        self.riddles = riddles
        self.category = category
        self.questionCount = UserDefaults.standard.integer(forKey: "\(category)questionCount")
        self.score = UserDefaults.standard.integer(forKey: "\(category)score")
    }
    
    var currentRiddle: Riddle {
        riddles[questionCount]
    }
    
    func handleAnswer(_ answer: String) {
        areButtonsDisabled = true
        if answer == currentRiddle.correctAnswer {
            score += 1
            answerCorrect = true
        } else {
            answerCorrect = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if self.questionCount < 9 {
                self.questionCount += 1
                self.selectedAnswer = nil
                self.answerCorrect = nil
                self.areButtonsDisabled = false
                self.saveScore()
            } else {
                self.showAlert = true
            }
        }
    }
    
    func resetQuiz() {
        questionCount = 0
        score = 0
        UserDefaults.standard.removeObject(forKey: "\(category)questionCount")
        UserDefaults.standard.removeObject(forKey: "\(category)score")
    }
    
    private func saveScore() {
        UserDefaults.standard.set(questionCount, forKey: "\(category)questionCount")
        UserDefaults.standard.set(score, forKey: "\(category)score")
    }
}
