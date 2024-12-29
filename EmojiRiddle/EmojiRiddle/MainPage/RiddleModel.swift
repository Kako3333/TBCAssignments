//
//  RiddleModel.swift
//  EmojiRiddle
//
//  Created by Gio Kakaladze on 27.12.24.
//
import Foundation
import SwiftUI

struct Riddle {
    let emojis: String
    let correctAnswer: String
    let options: [String]
    
    init(emojis: String, correctAnswer: String, options: [String]) {
        self.emojis = emojis
        self.correctAnswer = correctAnswer
        self.options = options.shuffled() 
    }
}

struct Category {
    let name: String
    let riddles: [Riddle]
}
