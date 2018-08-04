//
//  JLViperBaseAPIInteractor.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

final class JLViperBaseAPIInteractor: InteractorInterface {
  
  weak var response: JLViperBaseApiInteractorResponseProtocol?
  var provider: JLViperBaseApiProtocol
  
  init(provider: JLViperBaseApiProtocol) {
    self.provider = provider
  }
}

extension JLViperBaseAPIInteractor: JLViperBaseApiInteractorProtocol {
  func getSome(_ address: String, _ sensor: String) {
    guard let resp = response else {
      return
    }
    provider.getSome(with: address, sensor: sensor, success: { data in
      if let result = data as? Data {
        resp.responsegetSomeSuccess(JLViperBaseApiModel.parse(with: result))
      }
    }) { error in
      print(error as AnyObject)
      resp.responsegetSomeError()
    }
  }
}
