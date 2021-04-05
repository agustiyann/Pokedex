//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation
import Core
import Combine
import Alamofire
import Foundation

public struct GetPokemonsRemoteDataSource : DataSource {
  public typealias Request = Any

  public typealias Response = [PokemonResponse]

  private let _endpoint: String

  public init(endpoint: String) {
    _endpoint = endpoint
  }

  public func execute(request: Any?) -> AnyPublisher<[PokemonResponse], Error> {
    return Future<[PokemonResponse], Error> { completion in
      if let url = URL(string: _endpoint) {
        AF.request(url)
          .validate()
          .responseDecodable(of: PokemonResponse.self) { response in
            switch response.result {
            case .success(let value):
              completion(.success(value))
            case .failure:
              completion(.failure(URLError.invalidResponse))
            }
          }
      }
    }.eraseToAnyPublisher()
  }
}
