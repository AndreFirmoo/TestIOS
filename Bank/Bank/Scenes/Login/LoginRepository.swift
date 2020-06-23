//
//  LoginRepository.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit

import Alamofire

protocol LoginRepositoryProtocol {
    func getRequestUser(request: Login.Request, completion:@escaping (Result<UserMapper, AFError>) -> Void)
}



class LoginRepository : LoginRepositoryProtocol{
    static let shared = LoginRepository()
    private lazy var apiRepository: APIRepository = {
        let manager = APIRepository()
        return manager
    }()

    func getRequestUser(request: Login.Request, completion: @escaping (Result<UserMapper, AFError>) -> Void) {
        apiRepository.createRequest(route: API.login(username: request.username, password: request.password)) { (results) in
            completion(results)
        }
    }
    
}
