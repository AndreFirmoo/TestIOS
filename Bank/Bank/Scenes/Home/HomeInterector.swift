//
//  HomeInterector.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//


import UIKit

protocol HomeBusinessLogic{
  func getInfoStatements(request: Home.Request)
}

protocol HomeDataStore {
    var userId: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataPassing
{
    var dataStore: HomeDataStore?
    
    var presenter: HomePresentationLogic?
    var repository: HomeRepositoryProtocol?
    var user: UserRealm
    
    private lazy var realmRepository: RealmRepository = {
        let maneger = RealmRepository()
        return maneger
    }()
  
    init(repository: HomeRepositoryProtocol = HomeRepository.shared, user: UserRealm) {
        self.repository =  repository
        self.user = user
    }
    
    func removeUserFromRealm(){
        realmRepository.deleteObj(obj: user)
    }
    
    
  func getInfoStatements(request: Home.Request){
    guard let repository = repository else {
               let response = Home.Response(statementsList: nil, user: self.user, error: "no worker")
               self.presenter?.presentInformation(response: response)
               return
           }
    repository.getRequestStatementsList(request: request, completion: { (result) in
        print(result)
        switch result {
        case .success(let value):
            let response = Home.Response(statementsList: value, user: self.user, error: nil)
            self.prepare(response: response)
        case .failure(let error):
            let response = Home.Response(statementsList: nil, user: nil, error: error.localizedDescription)
            self.presenter?.presentInformation(response: response)
        }
    })
  }
    private func prepare(response:Home.Response){
        presenter?.presentInformation(response: response)
    }
    
}
