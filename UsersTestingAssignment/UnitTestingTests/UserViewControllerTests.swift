//
//  UserViewControllerTests.swift
//  UnitTestingTests
//
//  Created by Gio Kakaladze on 18.11.24.
//

import XCTest
@testable import UsersTestingAssignment

class UserViewControllerTests: XCTestCase {

    var userViewController: UserViewController!
    
    override func setUpWithError() throws {
        userViewController = UserViewController()
        userViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        userViewController = nil
    }

    func testTableView() {
        let mockUsers = [
            UserViewModel(user: User(gender: "male", name: Name(title: "Mr", first: "Davit", last: "Nakashidze"), email: "davit.nakashidze@example.com", picture: Picture(large: "fff", medium: "fff", thumbnail: "fff"), nat: "GEO", cell: "532532", phone: "63416634")),
            UserViewModel(user: User(gender: "female", name: Name(title: "Mrs", first: "Nini", last: "Kakaladze"), email: "nini.kakaladze@example.com", picture: Picture(large: "fff", medium: "fff", thumbnail: "fff"), nat: "USA", cell: "6243623", phone: "4262446"))
        ]
        userViewController.usersVM = mockUsers
        userViewController.tableView.reloadData()
        
        XCTAssertEqual(userViewController.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testTableViewCellDisplaysCorrectData() {
        let mockUsers = [
            UserViewModel(user: User(gender: "male", name: Name(title: "Mr", first: "Davit", last: "Nakashidze"), email: "davit.nakashidze@example.com", picture: Picture(large: "fff", medium: "fff", thumbnail: "fff"), nat: "GEO", cell: "532532", phone: "63416634")),
            UserViewModel(user: User(gender: "female", name: Name(title: "Mrs", first: "Nini", last: "Kakaladze"), email: "nini.kakaladze@example.com", picture: Picture(large: "fff", medium: "fff", thumbnail: "fff"), nat: "USA", cell: "6243623", phone: "4262446"))
        ]
        userViewController.usersVM = mockUsers
        userViewController.tableView.reloadData()

        let indexPath = IndexPath(row: 0, section: 0)
        if let cell = userViewController.tableView.cellForRow(at: indexPath) as? UserCell {
            XCTAssertEqual(cell.userNameLabel.text, "Mr Davit Nakashidze")
            XCTAssertEqual(cell.contactNumberLabel.text, "532532 / 63416634")
        }
    }

    func testTableViewWithNoUsers() {
        userViewController.usersVM = []
        userViewController.tableView.reloadData()
        
        XCTAssertEqual(userViewController.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func testNavigationBarTitle() {
        userViewController.loadViewIfNeeded()
        
        userViewController.usersVM = []
        let navBarTitle = userViewController.navigationItem.title!
        userViewController.tableView.reloadData()
        
        XCTAssertEqual(navBarTitle, "")
    }

}
