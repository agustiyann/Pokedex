//
//  APICall.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct API {

  static let baseUrl = "https://gist.githubusercontent.com/agustiyann/64c62e1d7affbdfd637123bab52f11e6/raw/"

}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {

  enum Gets: Endpoint {
    case list

    public var url: String {
      switch self {
      case .list: return "\(API.baseUrl)886e09ed7debc3a65fe2303b0abfded5d2e8a254/pokemon.json"
      }
    }
  }

}
