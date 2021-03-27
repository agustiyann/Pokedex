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
      case .list: return "\(API.baseUrl)ff543949312e373927dc8dfe0dc9e5a0a747378d/pokemon.json"
      }
    }
  }

}
