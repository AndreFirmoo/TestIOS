//
//  homePresenter.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright © 2020 Andre Jardim Firmo. All rights reserved.
//

import UIKit

protocol HomePresentationLogic
{
  func presentInformation(response: Home.Response)
}

class HomePresenter: HomePresentationLogic
{
    weak var viewController: HomeDisplayLogic?
    var statements: [Statement] = []
  
  // MARK: Do something
  
  func presentInformation(response: Home.Response){
    statements = response.statementsList?.statementList ?? []
    let viewModel = Home.ViewModel(response: response)
    viewController?.displaySomething(viewModel: viewModel)
  }
}
