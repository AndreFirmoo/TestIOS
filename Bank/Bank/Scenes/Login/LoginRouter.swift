//
//  LoginRouter.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation
import UIKit

@objc protocol LoginRouting{
    func routeToHome(login:LoginViewController, user: UserRealm)
}

protocol LoginDataPassing{
  var dataStore: LoginDataStore? { get }
}
class LoginRouter: NSObject, LoginRouting {
    //MARK: - Navigation init
    
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    var navigationController = UIViewController()
    
    init(navigationController: UIViewController){
        self.navigationController = navigationController
    }
    
     //MARK: - Routing and Navigations
    
    func routeToHome(login: LoginViewController, user: UserRealm) {
        login.dismiss(animated: true, completion: nil)
        
//         let homeViewController = HomeViewController(interector: HomeInteractor(repository: HomeRepository(), user: user), router: HomeRouter(navigationController: navigationController), presenter: HomePresenter())

        let home : HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController")
        home.setup(interactor: HomeInteractor(repository: HomeRepository(), user: user), router: HomeRouter(navigationController: navigationController), presenter: HomePresenter())
        
        home.modalPresentationStyle = .fullScreen
        login.present(home, animated: true, completion: nil)
        
    }
}
