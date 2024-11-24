//
//  UserModelTests.swift
//  UnitTestingTests
//
//  Created by Gio Kakaladze on 18.11.24.
//
import XCTest
@testable import UsersTestingAssignment

class UserModelTests: XCTestCase {

    var userList: UserList!

    override func setUpWithError() throws {
        let jsonMock = User.jsonMock
        let jsonData = jsonMock.data(using: .utf8)!

        do {
            userList = try JSONDecoder().decode(UserList.self, from: jsonData)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    override func tearDownWithError() throws {
        userList = nil
    }

    func testUserListCount() throws {
        XCTAssertEqual(userList.results.count, 1, "list should contain 1 user")
    }
    
    func testFirstName() throws {
        XCTAssertEqual(userList.results.first?.name.first, "Christian", "first name shold be Christian")
    }

    func testLastName() throws {
        XCTAssertEqual(userList.results.first?.name.last, "Nielsen", "last name should be Nielsen")
    }

    func testValidUserEmail() throws {
        let emailAt = "@"
        let userEmail = userList.results.first?.email

        XCTAssertTrue(((userEmail?.contains(emailAt)) != nil))
    }
}
