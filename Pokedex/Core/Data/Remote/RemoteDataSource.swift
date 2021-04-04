//
//  RemoteDataSource.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Alamofire
import Combine

protocol RemoteDataSourceProtocol: class {
  func getPokemonList() -> AnyPublisher<[PokemonResponse], Error>
}

final class RemoteDataSource: NSObject {
  private override init() {}

  static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {

  func getPokemonList() -> AnyPublisher<[PokemonResponse], Error> {
    return Future<[PokemonResponse], Error> { completion in
      guard let url = URL(string: Endpoints.Gets.list.url) else { return }

      AF.request(url).validate().responseDecodable(of: [PokemonResponse].self) { response in
        switch response.result {
        case .success(let value):
          completion(.success(value))
        case .failure:
          completion(.failure(URLError.invalidResponse))
        }
      }

    }.eraseToAnyPublisher()
  }

}
