//
//  HomeRouter.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import Foundation
import UIKit

@objc protocol HomeRoutingLogic {
  func routeToLogin(home: HomeViewController)
}

protocol HomeDataPassing{
   var dataStore: HomeDataStore? { get }
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    
    
    var navigationController: UIViewController
    
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    
    
    init(navigationController: UIViewController) {
        self.navigationController = navigationController
    }

  // MARK: Routing
    func routeToLogin(home: HomeViewController) {
        home.dismiss(animated: true, completion: nil)
        
//        let login = LoginViewController(interactor: LoginInteractor(repository: LoginRepository()), router: LoginRouter(navigationController: navigationController as! UINavigationController), presenter: LoginPresenter())
//        navigationController.present(login, animated: false, completion: nil)
    }
}
