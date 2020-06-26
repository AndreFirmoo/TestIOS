//
//  LoginPresenter.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit
import Alamofire

protocol LoginPresentationLogic {
    func presentLastUser(user: UserRealm)
    func presentError(error: String)
    func presentHome(response: Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayInfos?
    
  // MARK: Do something

    func presentLastUser(user: UserRealm) {
        viewController?.setupUser(user: user)
    }
    
    func presentError(error: String) {
        viewController?.showError(error: error)
    }
    
    func presentHome(response: Login.Response) {
        let viewModel = Login.ViewModel()
        viewController?.displayHome(viewModel: viewModel )
    }
}
