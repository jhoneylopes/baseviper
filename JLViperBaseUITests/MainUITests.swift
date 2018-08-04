//
//  MainUITests.swift
//  JLViperBaseUITests
//
//  Created by Jhoney Lopes on 24/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import XCTest
import Foundation

class MainUITests: XCTestCase {
  
  // MARK: - Setup
  let app = XCUIApplication()
  let elementQuery = XCUIApplication().scrollViews.otherElements
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    XCUIApplication().launch()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: - Commons
  func searchButton() {
    let searchButton = app.keyboards.buttons["Search"]    
    searchButton.tap()
  }
  
  func sendKeysTextField(id: String, text: String) {
    let element = elementQuery.textFields[id]
    element.tap()
    element.typeText(text)
  }
  
  func sendKeySearchBar(id: String, text: String) {
    let searchField = app.otherElements[id].searchFields.firstMatch
    searchField.tap()
    searchField.typeText(text)
  }
  
  func waitElement(element: Any, timeout: TimeInterval = 100.0) {
    let exists = NSPredicate(format: "exists == 1")
    expectation(for: exists, evaluatedWith: element, handler: nil)
    waitForExpectations(timeout: timeout, handler: nil)
  }
}
