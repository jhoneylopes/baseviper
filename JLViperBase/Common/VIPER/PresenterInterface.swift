//
//  AppDelegate.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

protocol PresenterInterface: class {
  
  func viewDidLoad()
  func viewWillAppear(animated: Bool)
  func viewDidAppear(animated: Bool)
  func viewWillDisappear(animated: Bool)
  func viewDidDisappear(animated: Bool)
  
}

extension PresenterInterface {
  
  func viewDidLoad() {
    fatalError("Implementation pending...")
  }
  
  func viewWillAppear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewDidAppear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewWillDisappear(animated: Bool) {
    fatalError("Implementation pending...")
  }
  
  func viewDidDisappear(animated: Bool) {
    fatalError("Implementation pending...")
  }
}
