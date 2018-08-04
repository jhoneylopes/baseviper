//
//  JLViperBaseApiModel.swift
//  JLViperBase
//
//  Created by Jhoney Lopes on 25/06/18.
//  Copyright © 2018 Jhoney Lopes. All rights reserved.
//

import Foundation

struct JLViperBaseApiModel: BaseResponseProtocol {
  
  // MARK: - Properties
  private var addresses: [JLViperBaseApiAddressModel]
  
  init(with addresses: [JLViperBaseApiAddressModel]) {
    self.addresses = addresses
  }
  
  private enum JLViperBaseKey {
    static let kResults = "results"
  }
  
  static func parse(with data: Data) -> JLViperBaseApiModel {
    let assembler: JLViperBaseApiModelAssembler = JLViperBaseApiAssembler()
    var map: JLViperBaseApiModel = assembler.resolve()
    
    let json = try? JSONSerialization.jsonObject(with: data, options: [])
    if let dict = json as? [String : AnyObject] {
      if let results = arrayContent(with: JLViperBaseKey.kResults, dict) {
        for dict in results {
          map.addresses.append(JLViperBaseApiAddressModel.parse(with: dict))
        }
      }
    }
    return map
  }
  
  // MARK: - Class Funcs
  
  func numOfAddresses() -> Int {
    return addresses.count
  }
  
  func getAddresses() -> [JLViperBaseApiAddressModel] {
    return addresses
  }
  
  func getAddress(for index: Int) -> JLViperBaseApiAddressModel {
    if addresses.count > index {
      return addresses[index]
    }
    let assembler: JLViperBaseApiAddressModelAssembler = JLViperBaseApiAssembler()
    return assembler.resolve()
  }
  
}

struct JLViperBaseApiAddressModel: BaseResponseProtocol {
  
  // MARK: - Properties
  private var id: String
  private var address: String
  private var locationLat: Double
  private var locationLng: Double
  
  init(with id: String, address: String, locationLat: Double, locationLng: Double) {
    self.id = id
    self.address = address
    self.locationLat = locationLat
    self.locationLng = locationLng
  }
  
  // MARK: - Key
  private enum JLViperBaseKey {
    static let kResults = "results"
    static let kFormattedAddress = "formatted_address"
    static let kGeometry = "geometry"
    static let kLocation = "location"
    static let kLat = "lat"
    static let kLng = "lng"
    static let id = "place_id"
  }
  
  static func parse(with dict: [String: AnyObject]) -> JLViperBaseApiAddressModel {
    let assembler: JLViperBaseApiAddressModelAssembler = JLViperBaseApiAssembler()
    var address: JLViperBaseApiAddressModel = assembler.resolve()
    fillWithDictionary(&address.id, key: JLViperBaseKey.id, dictionary: dict)
    fillWithDictionary(&address.address, key: JLViperBaseKey.kFormattedAddress, dictionary: dict)
    if let geo = dictionaryContent(with: JLViperBaseKey.kGeometry, dict) {
      if let location = dictionaryContent(with: JLViperBaseKey.kLocation, geo) {
        fillWithDictionary(&address.locationLat, key: JLViperBaseKey.kLat, dictionary: location)
        fillWithDictionary(&address.locationLng, key: JLViperBaseKey.kLng, dictionary: location)
      }
    }
    return address
  }
  
  // MARK: - Class Funcs
  func getAddressName() -> String {
    return self.address
  }
  
  func getLat() -> Double {
    return self.locationLat
  }
  
  func getLng() -> Double {
    return self.locationLng
  }
  
  func getId() -> String {
    return self.id
  }
  
}
