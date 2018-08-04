//
//  BaseProvider.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

typealias BaseSuccessCallback = (_ data: AnyObject?) -> Swift.Void
typealias BaseFailureCallback = (_ error: Error?) -> Swift.Void

public enum HTTPMethod: String {
  case options = "OPTIONS"
  case get = "GET"
  case head = "HEAD"
  case post = "POST"
  case put = "PUT"
  case patch = "PATCH"
  case delete = "DELETE"
  case trace = "TRACE"
  case connect = "CONNECT"
}

internal class BaseProvider {
  
  private enum BaseProviderKeys {
    static let query = "query"
  }
  
  // MARK: Bureau
  fileprivate static let kURL = "http://%@"
  
  // MARK: - Methods
  
  func request(method: HTTPMethod, endPoint: String, params: [String: Any]?, successBlock: @escaping BaseSuccessCallback, failureBlock: @escaping BaseFailureCallback) {
    
    let completeEndPoint = BaseProvider.kURL.format(endPoint)
    let url = completeEndPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    let urlString = URL(string: url)
    
    switch method {
    case .get:
      if let url = urlString {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
          DispatchQueue.main.async {
            if error != nil {              
              failureBlock(error)
            } else {
              if let usableData = data {
                successBlock(usableData as AnyObject)
              }
            }
          }
        }
        task.resume()
      }
    case .post:
      NSLog("%@", "No Service POST")
    case .put:
      NSLog("%@", "No Service PUT")
    default:
      NSLog("%@", "Service error")
    }
  }
  
}
