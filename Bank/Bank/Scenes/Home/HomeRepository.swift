//
//  HomeRepository.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//


import UIKit
import Alamofire

protocol HomeRepositoryProtocol {
    func getRequestStatementsList(request: Home.Request, completion: @escaping (Result<StatementList,AFError>)->Void)
}

class HomeRepository: HomeRepositoryProtocol{
    
    static let shared = HomeRepository()
    private lazy var apiRepository: APIRepository = {
        let maneger = APIRepository()
        return maneger
    }()
    
    func getRequestStatementsList(request: Home.Request, completion: @escaping (Result<StatementList, AFError>) -> Void) {
        apiRepository.createRequest(route: API.home(userId: request.userId), completion: completion)
        
    }
    
  
}
