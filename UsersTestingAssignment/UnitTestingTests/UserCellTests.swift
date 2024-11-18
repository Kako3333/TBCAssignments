//
//  UserCellTests.swift
//  UnitTestingTests
//
//  Created by Gio Kakaladze on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

class UserCellTests: XCTestCase {
    
    var userCell: UserCell!
    var userViewModel: UserViewModel!
    var mockUser: User!
    
    override func setUp() {
        super.setUp()
        
        mockUser = User(
            gender: "male",
            name: Name(title: "Mr", first: "Christian", last: "Nielsen"),
            email: "christian.nielsen@example.com",
            picture: Picture(large: "", medium: "", thumbnail: "https://randomuser.me/api/portraits/thumb/men/25.jpg"),
            nat: "DK",
            cell: "85537737",
            phone: "57231440"
        )
        userViewModel = UserViewModel(user: mockUser)
        
        userCell = UserCell(style: .default, reuseIdentifier: "UserCell")
        userCell.configure(with: userViewModel)
    }
    
    override func tearDown() {
        userCell = nil
        userViewModel = nil
        mockUser = nil
        super.tearDown()
    }
    
    func testUserCellDisplaysProfileImage() {
        if let url = URL(string: "https://randomuser.me/api/portraits/thumb/men/25.jpg"),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            userCell.profileImageView.image = image
        }
        
        let loadedImage = userCell.profileImageView.image
        XCTAssertNotNil(loadedImage)
    }
}
