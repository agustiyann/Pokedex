//
//  RemoteDataSource.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Alamofire

protocol RemoteDataSourceProtocol: class {
  func getPokemonList(result: @escaping (Result<[PokemonResponse], URLError>) -> Void)
}

final class RemoteDataSource: NSObject {
  private override init() {}

  static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {

  func getPokemonList(result: @escaping (Result<[PokemonResponse], URLError>) -> Void) {
    guard let url = URL(string: Endpoints.Gets.list.url) else { return }

    AF.request(url).validate().responseDecodable(of: PokemonsResponse.self) { response in
      switch response.result {
      case .success(let value):
        result(.success(value.results))
      case .failure:
        result(.failure(.invalidResponse))
      }
    }
  }

}
