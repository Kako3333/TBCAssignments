//
//  JSONManager.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 03.11.24.
//
import Foundation

class MainPageViewModel {
    
    private(set) var questions: [Question] = []

    func decodeQuizData(from fileName: String) -> QuizResponse? {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Failed to locate \(fileName) in bundle :((")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let quizResponse = try decoder.decode(QuizResponse.self, from: data)
            self.questions.append(contentsOf: quizResponse.results)
            return quizResponse
        }
        catch {
            print("Failed to decode \(fileName).json: \(error)")
            return nil
        }
    }
}


