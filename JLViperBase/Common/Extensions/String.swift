//
//  String.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

extension String {
  func format(_ obj: Any) -> String {
    let str = String(format: self, arguments: [String(describing: obj)])
    return str
  }
}
