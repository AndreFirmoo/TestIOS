//
//  BankTests.swift
//  BankTests
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import XCTest
import Alamofire
@testable import Bank

class LoginInterectorTests: XCTestCase {
    
    var user: UserRealm!
    var loginInterector: LoginInteractor!
    fileprivate var repository: MockRepository!
    
    override func setUp() {
        super.setUp()
        self.repository = MockRepository()
        self.user = UserRealm()
        self.loginInterector = LoginInteractor(repository: repository)
    }
    
    override func tearDown() {
        self.loginInterector = nil
        self.user = nil
        self.repository = nil
        super.tearDown()
    }
    
    func testFetchWithoutRepository(){
        let expect = XCTestExpectation(description: "Error")
        loginInterector.repository = nil
        loginInterector.presenter?.presentError(error: "Error")
        if loginInterector.repository == nil {
            expect.fulfill()
        }
        let request = Login.Request(username: "", password: "")
        loginInterector.getValidationLogin(request: request)
    }
    
    func testNoUserName(){
        let expect = XCTestExpectation(description: Errors.Error.invalidUser)
        let request = Login.Request(username: "hey", password:  "Test@1")
        if request.username == "hey"{
            expect.fulfill()
        }
        loginInterector.getValidationLogin(request: request)
    }
    
    func testNoPassword(){
       let expect = XCTestExpectation(description: Errors.Error.invalidUser)
       let request = Login.Request(username: "test_user@test.com", password:  "testes")
       if request.password == "testes"{
           expect.fulfill()
       }
       loginInterector.getValidationLogin(request: request)
    }
    
    func testUserLogin(){
        let expect = XCTestExpectation(description: "success")
        let request = Login.Request(username: "teste@test.com", password: "Test@1")
        loginInterector.getValidationLogin(request: request)
        let user = UserMapper(userAccount: UserInfo(userId: 1.0, name: "Jose da Silva Teste", bankAccount: "2050", agency: "0123145164", balance: 3.3445), error: ErrorResponse(code: nil, message: nil))
        if user.userAccount.name == "Jose da Silva Teste"{
            expect.fulfill()
        }
    }
    
    
    

}
fileprivate class MockRepository: LoginRepositoryProtocol{
    var user: UserMapper?
    func getRequestUser(request: Login.Request, completion: @escaping (Result<UserMapper, AFError>) -> Void) {
        if let user = user{
            completion(Result.success(user))
        }
    }
}
