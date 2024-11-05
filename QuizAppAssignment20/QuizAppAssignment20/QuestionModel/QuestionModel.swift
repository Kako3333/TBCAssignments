//
//  QuestionModel.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 03.11.24.
//

import Foundation

struct QuizResponse: Codable {
    let responseCode: Int
    let results: [Question]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

struct Question: Codable {
    let question: String
    let difficulty: String
    let category: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case question
        case difficulty
        case category
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}



