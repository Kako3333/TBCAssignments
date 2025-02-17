//
//  UserViewModel.swift
//  UsersTesting
//
//  Created by Nino Godziashvili on 15.11.24.
//

import UIKit

class UserViewModel: NSObject {
    
    public let user: User
    
    public init(user: User) {
        self.user = user
    }
    
    public var fullName: String {
        return [user.name.title, user.name.first, user.name.last].joined(separator: " ").trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var contactNumber: String {
        return [user.cell, user.phone].joined(separator: " / ").trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public var thumbnailImageUrl: URL? {
        return URL(string: user.picture.thumbnail)
    }
    
    public var email: String {
        return user.email
    }
}

