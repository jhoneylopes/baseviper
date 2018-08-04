//
//  BaseRouter.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import UIKit

final class BaseRouter {
  
  // MARK: - Properties
  let window: UIWindow
  let baseNavigationController: UINavigationController = UINavigationController()
  
  // MARK: - Init

  init(window: UIWindow) {
    self.window = window
    window.rootViewController = baseNavigationController
    window.backgroundColor = UIColor.white
    window.makeKeyAndVisible()
  }
  
  // MARK: - Router
  func initRouter() {    
    presentLogin()
  }
    
  // MARK: - Private Methods
  func presentLogin() {
    let loginModule = HomeWireframe(navigationController: baseNavigationController)
    loginModule.show(with: .root, animated: true)
  }
}
