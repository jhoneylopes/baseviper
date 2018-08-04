//
//  AppDelegate.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import UIKit

enum Transition {
  case root
  case push
  case stack(viewControllers: [UIViewController])
  case present(fromViewController: UIViewController)
  case presentSelf
  case presentInTab(tabController:UIViewController)
  case createNavFrom(fromViewController: UIViewController)
}

protocol WireframeInterface: class {
  func popToViewController(viewController: UIViewController, animated: Bool)
  func popFromNavigationController(animated: Bool)
  func dismiss(animated: Bool)
}

class BaseWireframe {
  
  weak var navigationController: UINavigationController!
  weak var tabBarController: UITabBarController?

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
  func show(_ viewController: UIViewController, with transition: Transition, animated: Bool) {
    switch transition {
      
    case .push:
      navigationController.pushViewController(viewController, animated: animated)
      
    case .present(let fromViewController):
      navigationController.viewControllers = [viewController]
      fromViewController.present(navigationController, animated: animated, completion: nil)
      
    case .root:
      navigationController.setViewControllers([viewController], animated: animated)
      
    case .stack(let viewControllers):
      let stack = viewControllers + [viewController]
      navigationController.setViewControllers(stack, animated: animated)
      
    case .presentSelf:
      navigationController.present(viewController, animated: true)
      
    case .presentInTab( let tab ):
      tab.present(self.navigationController, animated: true, completion: nil)
      
    case .createNavFrom(let fromVC):
      self.navigationController = BSNavigationController(rootViewController: viewController)
      fromVC.present(navigationController, animated: animated, completion: nil)
      
    }
  }
}

// MARK: - Alerts

extension BaseWireframe {
  func showGenericErrorAlert() {
    let alert = UIAlertController(title: "Error", message: "Sorry we are having some issues at the moment. Please try again later.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
    self.navigationController.present(alert, animated: true)
  }
  
  func showAlert(_ title: String, _ msg: String, _ buttonTitle: String) {
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
    self.navigationController.present(alert, animated: true)
  }
}

// MARK: - Navigation
extension BaseWireframe: WireframeInterface {
  func popToRoot(_ animated: Bool) {
    _ = navigationController.popToRootViewController(animated: animated)
  }
  
  func popToViewController(viewController: UIViewController, animated: Bool) {
    _ = navigationController.popToViewController(viewController, animated: animated)
  }
  
  func popFromNavigationController(animated: Bool) {
    _ = navigationController.popViewController(animated: animated)
  }
  
  func dismiss(animated: Bool) {
    if navigationController != nil {
      navigationController.dismiss(animated: animated)
    }
  }
}
