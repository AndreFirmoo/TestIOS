//
//  HomePresenteTests.swift
//  BankTests
//
//  Created by Andre Jardim Firmo on 24/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import XCTest
import Alamofire
@testable import Bank


class HomePresenteTests: XCTestCase {
    var homePresenter: HomePresenter!
    
    override func setUp() {
           super.setUp()
           self.homePresenter = HomePresenter()
           
       }
       
       override func tearDown() {
           self.homePresenter = nil
           super.tearDown()
       }
       
       func testPresenter() {
           let response = Home.Response(statementsList: nil, user: nil, error: "no user")
           homePresenter.presentInformation(response: response)
           XCTAssertTrue(homePresenter.statements.count == 0)
       }

}
