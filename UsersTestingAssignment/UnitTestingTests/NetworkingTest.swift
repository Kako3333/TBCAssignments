//
//  NetworkingTest.swift
//  UnitTestingTests
//
//  Created by Gio Kakaladze on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

final class NetworkingTest: XCTestCase {
    
    var networkManager: NetworkManager!
    var fetchedUsers: [User] = []
    
    override func setUpWithError() throws {
        networkManager = NetworkManager.sharedInstance
    }

    override func tearDown() {
        networkManager = nil
        fetchedUsers = []
    }
    
    func testFetchUsersWithNetworkManager() {
        let expectation = self.expectation(description: "fetching users")
        
        networkManager.fetchUsers(withLimit: 1) { users in
            self.fetchedUsers = users
            XCTAssertEqual(users.count, 1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testValidMail() {
        let expectation = self.expectation(description: "fetching")
        
        networkManager.fetchUsers(withLimit: 1) { users in
            self.fetchedUsers = users
            let userEmail = self.fetchedUsers.first?.email
            XCTAssertNotNil(userEmail, "mail shouldnot be nil")
            XCTAssertTrue(userEmail!.contains("@"), "mail should contain '@'")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testLastNameNotEmpty() {
        let expectation = self.expectation(description: "fetching")
        
        networkManager.fetchUsers(withLimit: 1) { users in
            self.fetchedUsers = users
            let lastName = self.fetchedUsers.first?.name.last
            XCTAssertNotNil(lastName, "last name shouldnot be nil")
            XCTAssertFalse(lastName!.isEmpty, "last name should not be empy")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    //არაბულ სახელზე დაფეილდება...
    func testNameStartsWithCapital() {
        let expectation = self.expectation(description: "fetching")
        
        networkManager.fetchUsers(withLimit: 1) { users in
            self.fetchedUsers = users
            guard let firstName = self.fetchedUsers.first?.name.first,
                  let lastName = self.fetchedUsers.first?.name.last else {
                XCTFail("name or surname is nil")
                expectation.fulfill()
                return
            }
            XCTAssertTrue(firstName.first?.isUppercase == true)
            XCTAssertTrue(lastName.first?.isUppercase == true)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}



