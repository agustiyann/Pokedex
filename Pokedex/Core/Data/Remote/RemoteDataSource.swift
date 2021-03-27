//
//  RemoteDataSource.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

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

    let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
      if maybeError != nil {
        result(.failure(.addressUnreachable(url)))
      } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
        let decoder = JSONDecoder()
        do {
          let categories = try decoder.decode(PokemonsResponse.self, from: data).results
          result(.success(categories))
        } catch {
          result(.failure(.invalidResponse))
        }
      }
    }
    task.resume()
  }

  func getPokemonInfo(id: Int, result: @escaping (Result<PokemonInfoResponse, URLError>) -> Void) {
    guard let url = URL(string: "\(Endpoints.Gets.info.url)\(id)") else { return }

    let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, maybeError in
      if maybeError != nil {
        result(.failure(.addressUnreachable(url)))
      } else if let data = maybeData, let response = maybeResponse as? HTTPURLResponse, response.statusCode == 200 {
        let decoder = JSONDecoder()
        do {
          let pokemon = try decoder.decode(PokemonInfoResponse.self, from: data)
          result(.success(pokemon))
        } catch {
          result(.failure(.invalidResponse))
        }
      }
    }
    task.resume()
  }

}
