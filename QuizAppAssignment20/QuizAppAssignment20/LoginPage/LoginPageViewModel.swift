//
//  LoginPageViewModel.swift
//  QuizAppAssignment20
//
//  Created by Gio Kakaladze on 03.11.24.
//

import Foundation

class LoginPageViewModel {
    var username: String?
    var password: String?
    var confirmPassword: String?
    
    var isInputValid: Bool {
        return !(username?.isEmpty ?? true) &&
               !(password?.isEmpty ?? true) &&
               !(confirmPassword?.isEmpty ?? true)
    }
    
    var doPasswordsMatch: Bool {
        return password == confirmPassword
    }
    
    func saveCredentials() throws {
        guard let username = username, let password = password else {
            throw NSError(domain: "CredentialsError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Username and password cannot be nil"])
        }
        try KeyChainManager.save(username: username, password: password)
    }
}
