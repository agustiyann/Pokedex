//
//  APICall.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct API {

  static let baseUrl = "https://gist.githubusercontent.com/mrcsxsiq/b94dbe9ab67147b642baa9109ce16e44/raw/"

}

protocol Endpoint {

  var url: String { get }

}

enum Endpoints {

  enum Gets: Endpoint {
    case list

    public var url: String {
      switch self {
      case .list: return "\(API.baseUrl)97811a5df2df7304b5bc4fbb9ee018a0339b8a38/"
      }
    }
  }

}
