//
//  LoginViewController.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit
import Realm

protocol LoginDisplayInfos: class {
    func showError(error: String)
    func setupUser(user: UserRealm)
    func displayHome(viewModel: Login.ViewModel)
}

class LoginViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    //MARK: - Variables
    var router: LoginRouter?
    private var interactor: LoginInteractor?
    private var presenter: LoginPresenter?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
       super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.create()
     }
    init(interactor: LoginInteractor, router: LoginRouter, presenter: LoginPresenter) {
        self.interactor = interactor
        self.interactor?.presenter = presenter
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
   
    
    private func create(){
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(navigationController: self)
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.dataStore = interactor
    }
    
      required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        create()
      }
    
    
    
    //MARK: - Setup
    private func setup(){
        interactor?.getLastUser()
    }
    //MARK: - Router to Home
    
    @IBAction func login(_ sender: Any) {
        if usernameTextField.text == ""  || passwordTextField.text == ""{
            showError(error: "Usuario ou senha invalidos")
        }else{
            let requestUser = Login.Request(username: usernameTextField.text! ,
                                            password: passwordTextField.text! )
            interactor?.getValidationLogin(request: requestUser)
        }
    }
    func login(){
         if let user = interactor?.user {
            router?.routeToHome(login: self, user: user)
        }
    }
    
    
}

extension LoginViewController: LoginDisplayInfos {
    func showError(error: String) {
         AlertView.showAlert(view: self, title: "Error", message: error)
    }
    
    func setupUser(user: UserRealm) {
        usernameTextField.text = user.name
    }
    
    func displayHome(viewModel: Login.ViewModel) {
        if let user = interactor?.user {
            router?.routeToHome(login: self, user: user)
        }
    }
}
