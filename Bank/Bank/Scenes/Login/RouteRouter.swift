//
//  RouteRouter.swift
//  Bank
//
//  Created by Andre Jardim Firmo on 23/06/20.
//  Copyright (c) 2020 Andre Jardim Firmo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol RouteRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol RouteDataPassing
{
  var dataStore: RouteDataStore? { get }
}

class RouteRouter: NSObject, RouteRoutingLogic, RouteDataPassing
{
  weak var viewController: RouteViewController?
  var dataStore: RouteDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: RouteViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: RouteDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
