//
//  HomeViewController.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright (c) 2018 Jhoney Lopes. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet var tableView: UITableView!
  @IBOutlet var searchBar: UISearchBar!
  
  // MARK: - Class properties
  
  // MARK: - Public properties
  
  var presenter: HomePresenterInterface!
  
  // MARK: - Life Cycle - 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    self.viewConfiguration()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Init Deinit -
  
  required convenience init() {
    self.init(nibName: nil, bundle: nil)
  }
  
  deinit {
    
  }
  
  // MARK: - Class Configurations
  
  private func viewConfiguration() {
    let nib = UINib(nibName: HomeConfig.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: HomeConfig.identifier)    
  }
  
  // MARK: - Class Methods
  
  // MARK: - UIActions
  
}

// MARK: - Extensions

extension HomeViewController: HomeViewInterface {
  func reloadData() {
    tableView.reloadData()
  }
}

extension HomeViewController: UISearchBarDelegate {
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    presenter.callSearch(searchBar.text ?? "")
  }
  
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return presenter.numberOfSections(in: tableView)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return presenter.tableView(tableView, numberOfRowsInSection: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return presenter.tableView(tableView, cellForRowAt: indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter.tableView(tableView, didSelectRowAt: indexPath)
  }
}
