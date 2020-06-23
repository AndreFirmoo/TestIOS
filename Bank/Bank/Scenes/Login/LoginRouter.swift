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
//        login.present(homeViewController, animated: true, completion: nil)
        let home = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController")
        UIApplication.topViewController()?.present(home, animated: true, completion: nil)
        
    }
}
