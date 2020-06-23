//
//  LoginInteractor.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit
import Realm

protocol LoginBusinessLogic
{
  func getValidationLogin(request: Login.Request)
}


protocol LoginDataStore {
    var user: UserRealm? { get set }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var presenter: LoginPresentationLogic?
    var repository: LoginRepository?
    var user: UserRealm?
    
    private lazy var realmRepository: RealmRepository = {
        let manager = RealmRepository()
        return manager
    }()
    
    
  
    init(repository: LoginRepositoryProtocol = LoginRepository.shared){
        self.repository = repository as! LoginRepository
    }
    
    
    func getLastUser() {
        guard let user = realmRepository.getObj() else {
            return
        }
        self.user = user
        presenter?.presentLastUser(user: user)
   }
    
    
  // MARK: Do something
  
  func getValidationLogin(request: Login.Request)
  {
    repository = LoginRepository()
    repository?.getRequestUser(request: request, completion: {[weak self]  (result) in
        switch result{
        case .success(let value):
            let response = Login.Response(user: value)
            self?.setupResponse(response: response, userName: request.username)
        case .failure(let error):
            self?.presenter?.presentError(error: error.localizedDescription)
        }
    })

  }
    
    private func setupResponse( response: Login.Response, userName: String){
        let newUser = UserRealm()
        newUser.userId = "\(response.user?.userAccount.userId ?? 0)"
        newUser.account = "\(response.user?.userAccount.agency ?? "") / \(response.user?.userAccount.bankAccount ?? "")"
        newUser.balance = "R$ \(response.user?.userAccount.balance ?? 0)"
        newUser.name = response.user?.userAccount.name ?? ""
        newUser.username = userName
        if let user = self.user {
           realmRepository.updateObj(obj: user)
        } else {
           self.user = newUser
           realmRepository.saveObjc(obj: newUser)
        }
        presenter?.presentSomething(response: response)
    }
}