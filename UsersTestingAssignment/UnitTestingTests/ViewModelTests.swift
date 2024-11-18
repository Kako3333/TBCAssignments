//
//  ViewModelTests.swift
//  UnitTestingTests
//
//  Created by Gio Kakaladze on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class ViewModelTests: XCTestCase {
    
    var viewModel: UserViewModel?
    
    override func setUpWithError() throws {
        let user = User(
            gender: "female",
            name: Name(title: "Mrs", first: "Mari", last: "Gogiberidze"),
            email: "mari.gogib@example.com",
            picture: Picture(large: "", medium: "", thumbnail: ""),
            nat: "GEO",
            cell: "6536533",
            phone: "523526"
        )
        
        viewModel = UserViewModel(user: user)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testFullName() {
        let fullName = viewModel?.fullName
        let expectedFullName = "Mrs Mari Gogiberidze"
        
        XCTAssertEqual(fullName, expectedFullName)
    }
    
    func testPhoneNumber() {
        let fullPhoneNumber = viewModel?.contactNumber
        let expectedPhoneNumber = "6536533 / 523526"
        
        XCTAssertEqual(fullPhoneNumber, expectedPhoneNumber)
    }
}
