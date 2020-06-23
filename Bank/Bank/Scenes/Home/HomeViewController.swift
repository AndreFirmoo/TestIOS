//
//  HomeViewController.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit


protocol HomeDisplayLogic: class{
  func displaySomething(viewModel: Home.ViewModel)
}


class HomeViewController: UIViewController, HomeDisplayLogic {
    
    @IBOutlet weak var usernameLb: UILabel!
    @IBOutlet weak var userAccontLb: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    
    

    var router: HomeRouter?
    private var interector: HomeInteractor
    private var presenter: HomePresenter
    private var tableViewDataSource: HomeDataSource?
    
   init(interactor: HomeInteractor, router: HomeRouter, presenter: HomePresenter) {
        self.interector = interactor
        self.interector.presenter = presenter
        self.presenter = presenter
        self.router = router
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     
     // MARK: - View lifecycle
     
//        private func setup()
//        {
//            let viewController = self
//            let interactor = HomeInteractor(user: user)
//            let presenter = HomePresenter()
//            let router = HomeRouter(navigationController:self)
//            viewController.interector = interactor
//            viewController.router = router
//            interactor.presenter = presenter
//            presenter.viewController = viewController
//            router.viewController = viewController
//            router.dataStore = interactor as! HomeDataStore
//        }
    
    
    
       override func viewDidLoad() {
           
           populateInformations()
           setupView()
               
          }
       
       private func setupView() {
            presenter.viewController = self
              
            HomeDataSource.setupHome(tableView: tableview)
            tableViewDataSource = HomeDataSource(presenter: presenter)
            tableview.dataSource = tableViewDataSource
            tableview.delegate = tableViewDataSource
          }
     
     // MARK: - PopulateInformations
     
     func populateInformations(){
        let request = Home.Request(userId: interector.user.userId ?? "1.0")
        interector.getInfoStatements(request: request)
     }
    
    func displaySomething(viewModel: Home.ViewModel) {
        
    }

}
