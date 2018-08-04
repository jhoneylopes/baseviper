//
//  JLViperBaseApiModelProtocol.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

protocol JLViperBaseApiModelAssembler {
  func resolve() -> JLViperBaseApiModel
}

extension JLViperBaseApiModelAssembler {
  func resolve() -> JLViperBaseApiModel {
    return JLViperBaseApiModel(with: [])
  }
}

protocol JLViperBaseApiAddressModelAssembler {
  func resolve() -> JLViperBaseApiAddressModel
}

extension JLViperBaseApiAddressModelAssembler {
  func resolve() -> JLViperBaseApiAddressModel {
    return JLViperBaseApiAddressModel(with: "", address: "", locationLat: 0.0, locationLng: 0.0)
  }
}

class JLViperBaseApiAssembler: JLViperBaseApiAddressModelAssembler, JLViperBaseApiModelAssembler { }
