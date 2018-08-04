//
//  JLViperBaseAPIInteractorProtocol.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

protocol JLViperBaseApiInteractorProtocol: InteractorInterface {
  func getSome(_ address: String, _ sensor: String)
}

protocol JLViperBaseApiInteractorResponseProtocol: class {
  func responsegetSomeSuccess(_ response: JLViperBaseApiModel)
  func responsegetSomeError()
}
