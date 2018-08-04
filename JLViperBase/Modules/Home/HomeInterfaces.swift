//
//  HomeInterfaces.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright (c) 2018 Jhoney Lopes. All rights reserved.
//
//

import UIKit

enum HomeNavigationOption {  
  case noResults
  case error
}

protocol HomeWireframeInterface: WireframeInterface {
  func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
  func reloadData()
}

protocol HomePresenterInterface: PresenterInterface {
  func callSearch(_ address: String)
  func numberOfSections(in tableView: UITableView) -> Int
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}
