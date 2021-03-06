//
//  HomeViewController.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit


protocol HomeDisplayLogic: class{
    func displayPrimaryInformation(viewModel: Home.ViewModel)
}


class HomeViewController: UIViewController, HomeDisplayLogic {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var usernameLb: UILabel!
    @IBOutlet weak var userAccontLb: UILabel!
    @IBOutlet weak var userBalance: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    
    //MARK: - Initializer Home
    var router: HomeRouter?
    private var interector: HomeInteractor?
    private var presenter: HomePresenter?
    private var tableViewDataSource: HomeDataSource?
    
    //MARK: - Setup Home
    public func setup(interactor: HomeInteractor, router: HomeRouter, presenter: HomePresenter) {
        self.interector = interactor
        self.interector?.presenter = presenter
        self.presenter = presenter
        self.router = router
        setupView()
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        populateInformations()
        self.tableview.delegate = tableViewDataSource
        self.tableview.dataSource = tableViewDataSource
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //MARK: - Setup TableView
    private func setupView() {
        self.presenter?.viewController = self
        
        HomeDataSource.setupHome(tableView: self.tableview)
        tableViewDataSource = HomeDataSource(presenter: self.presenter!)
        
    }
    //MARK: - Logout Button - IBAction
    @IBAction func logout(_ sender: Any) {
        self.interector?.removeUserFromRealm()
        router?.routeToLogin(home: self)
    }
    
    // MARK: - PopulateInformations
    
    func populateInformations(){
        let request = Home.Request(userId: interector?.user.userId ?? "1")
        self.interector?.getInfoStatements(request: request)
    }
    
    func displayPrimaryInformation(viewModel: Home.ViewModel) {
        usernameLb.text = viewModel.response.user?.name
        userAccontLb.text = viewModel.response.user?.account
        userBalance.text = viewModel.response.user?.balance
        tableview.reloadData()
    }
    
}
