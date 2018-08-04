//
//  JLViperBaseApiProvider.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

enum JLViperBaseApiProvider {
  
  // MARK: - Cases
  case JLViperBaseApi
  
  // MARK: - Path
  private var path: String {
    switch self {
    case .JLViperBaseApi:
      return "site.com/api/xpto?query"
    }
  }
  
  // MARK: - Methods
  private var method: HTTPMethod {
    switch self {
    case .JLViperBaseApi:
      return .get
    }
  }
  
}

// MARK: - Extensions
extension JLViperBaseApiProvider: JLViperBaseApiProtocol {
  func getSome(with address: String, sensor: String, success: @escaping BaseSuccessCallback, failure: @escaping BaseFailureCallback) {
    
    let completePath = String(format: path, address, sensor)
    
    BaseProvider().request(method: method, endPoint: completePath, params: nil, successBlock: { response in      
      success(response)
    }) { error in
      failure(error)
    }
  }
  
  
}
