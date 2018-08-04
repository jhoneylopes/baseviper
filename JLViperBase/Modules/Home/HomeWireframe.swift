//
//  HomeWireframe.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright (c) 2018 Jhoney Lopes. All rights reserved.
//
//

import UIKit

final class HomeWireframe: BaseWireframe {
  
  // MARK: - Private properties
  private let moduleViewController = HomeViewController(nibName: nil, bundle: nil)
  
  // MARK: - Module setup
  func configureModule(with viewController: HomeViewController) {
    
    let interactor = JLViperBaseAPIInteractor(provider: JLViperBaseApiProvider.JLViperBaseApi)
    let presenter = HomePresenter(wireframe: self, view: viewController, interactor: interactor)
    viewController.presenter = presenter
    interactor.response = presenter
  }
  
  // MARK: - Transitions
  func show(with transition: Transition, animated: Bool = true) {
    configureModule(with: moduleViewController)
    show(moduleViewController, with: transition, animated: animated)
  }
  
  // MARK: - Private Routing
  func showAlertError() {
    showGenericErrorAlert()
  }
  
  func showAlertNoResults() {
    showAlert("Sorry!", "No results for this search.", "Okay")
  }
}

// MARK: - Extensions
extension HomeWireframe: HomeWireframeInterface {
  
  func navigate(to option: HomeNavigationOption) {
    switch option {    
    case .error:
      showAlertError()
    case .noResults:
      showAlertNoResults()
    }
  }
}
