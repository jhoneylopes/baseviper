//
//  JLViperBaseApiProtocol.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

protocol JLViperBaseApiProtocol {
  func getSome(with address: String,sensor: String,
                         success: @escaping BaseSuccessCallback,
                         failure: @escaping BaseFailureCallback)
}
