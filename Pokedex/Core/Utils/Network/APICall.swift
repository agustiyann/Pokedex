//
//  APICall.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct API {

  static let baseUrl = "https://pokeapi.co/api/v2/"

}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {

  enum Gets: Endpoint {
    case list
    case info

    public var url: String {
      switch self {
      case .list: return "\(API.baseUrl)pokemon?limit=20&offset=0"
      case .info: return "\(API.baseUrl)pokemon/"
      }
    }
  }

}
