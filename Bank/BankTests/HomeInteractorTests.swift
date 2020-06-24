//
//  HomeInteractor.swift
//  BankTests
//
//  Created by Andre Jardim Firmo on 24/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import XCTest
import Alamofire
@testable import Bank

class HomeInteractorTests: XCTestCase {
    var user: UserRealm!
    var homeInterector: HomeInteractor!
    fileprivate var repository: MockHomeRepository!
    
    override func setUp() {
        super.setUp()
        self.repository = MockHomeRepository()
        self.user = UserRealm()
        self.homeInterector = HomeInteractor(repository: repository, user: user)
       }
       
    override func tearDown() {
       self.homeInterector = nil
       self.user = nil
       self.repository = nil
       super.tearDown()
    }
    
    
    func testFetchWithoutRepository() {
        let expect = XCTestExpectation(description: "no repository")
        homeInterector.repository = nil
        let response = Home.Response(statementsList: nil, user: nil, error: expect.description)
        homeInterector.presenter?.presentInformation(response: response)
        if homeInterector.repository == nil {
            expect.fulfill()
        }
        let request = Home.Request(userId: "01")
        homeInterector.getInfoStatements(request: request)
    }
    
    func testFetchWithoutUser() {
        let expect = XCTestExpectation(description: "no user info")
        repository.statementList = nil
        let response = Home.Response(statementsList: nil, user: nil, error: "no user info")
        homeInterector.presenter?.presentInformation(response: response)
        if response.statementsList == nil {
            expect.fulfill()
        }
        let request = Home.Request(userId: "")
        homeInterector.getInfoStatements(request: request)
    }
    
}

fileprivate class MockHomeRepository: HomeRepositoryProtocol{
    var statementList: StatementList?
    func getRequestStatementsList(request: Home.Request, completion: @escaping (Result<StatementList, AFError>) -> Void) {
        if let statements = statementList {
            completion(Result.success(statements))
        }
   }

}
