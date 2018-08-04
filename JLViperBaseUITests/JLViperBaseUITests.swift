//
//  JLViperBaseUITests.swift
//  JLViperBaseUITests
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import XCTest

class JLViperBaseUITests: MainUITests {
  
  func testNoResult() {
    sendKeySearchBar(id: "home_search_bar_element", text: "Belo Horizonte")
    searchButton()
  }
  
}
