//
//  JLViperBaseTests.swift
//  JLViperBaseTests
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import XCTest
@testable import JLViperBase

extension JLViperBaseApiModelAssembler {
  func resolveNoResults() -> JLViperBaseApiModel {
    return JLViperBaseApiModel(with: [])
  }
  func resolveBH() -> JLViperBaseApiModel {
    return JLViperBaseApiModel(with: [JLViperBaseApiAddressModel(with: "ChIJiUIyZaGQpgARff0Fu8gdHXA", address: "Belo Horizonte - State of Minas Gerais, Brazil", locationLat: -19.9172987, locationLng: -43.9345593)])
  }
  func resolveMany() -> JLViperBaseApiModel {
    return JLViperBaseApiModel(with: [
      JLViperBaseApiAddressModel(with: "1234", address: "B1", locationLat: 0.00, locationLng: 0.00),
      JLViperBaseApiAddressModel(with: "1234", address: "B2", locationLat: 0.00, locationLng: 0.00),
      JLViperBaseApiAddressModel(with: "1234", address: "B3", locationLat: 0.00, locationLng: 0.00)])
  }
}

class TestJLViperBaseApiAssembler: JLViperBaseApiModelAssembler { }

class JLViperBaseApiTests: XCTestCase {
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testNoAddress() {
    getSome(with: "", sensor: "", success: { response in
      if let map = response as? JLViperBaseApiModel {
        if map.numOfAddresses() > 0 {
          XCTAssert(false)
        } else {
          XCTAssert(true)
        }
      }
    }) { error in
      XCTAssert(false)
    }
  }
  
  func testSpecificAddress() {
    getSome(with: "Belo Horizonte", sensor: "", success: { response in
      if let map = response as? JLViperBaseApiModel {
        if let address = map.getAddresses().first {
          if address.getId() == "ChIJiUIyZaGQpgARff0Fu8gdHXA" {
            XCTAssert(true)
          } else {
            XCTAssert(false)
          }
        }
      }
    }) { error in
      XCTAssert(false)
    }
  }
  
  func testManyAddresses() {
    getSome(with: "B", sensor: "", success: { response in
      if let map = response as? JLViperBaseApiModel {
        if map.numOfAddresses() > 0 {
          XCTAssert(true)
        } else {
          XCTAssert(false)
        }
      }
    }) { error in
      XCTAssert(false)
    }
  }
  
  func testFailure() {
    getSome(with: "*", sensor: "", success: { response in
      if let map = response as? JLViperBaseApiModel {
        if map.numOfAddresses() > 0 {
          XCTAssert(false)
        } else {
          XCTAssert(false)
        }
      }
    }) { error in
      XCTAssert(true)
    }
  }
}

extension JLViperBaseApiTests: JLViperBaseApiProtocol {
  func getSome(with address: String, sensor: String, success: @escaping BaseSuccessCallback, failure: @escaping BaseFailureCallback) {
    let testAssembler: JLViperBaseApiModelAssembler = TestJLViperBaseApiAssembler()
    switch address {
    case "":
      success(testAssembler.resolveNoResults() as AnyObject)
    case "Belo Horizonte":
      success(testAssembler.resolveBH() as AnyObject)
    case "B":
      success(testAssembler.resolveMany() as AnyObject)
    default:
      failure(nil)
    }
  }
}
