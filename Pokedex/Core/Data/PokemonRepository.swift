//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

protocol PokemonRepositoryProtocol {
  func getPokemonList(result: @escaping (Result<[PokemonModel], Error>) -> Void)
}

final class PokemonRepository: NSObject {
  typealias PokemonInstance = (RemoteDataSource) -> PokemonRepository

  fileprivate let remote: RemoteDataSource

  private init(remote: RemoteDataSource) {
    self.remote = remote
  }

  static let sharedInstance: PokemonInstance = { remoteRepo in
    return PokemonRepository(remote: remoteRepo)
  }
}

extension PokemonRepository: PokemonRepositoryProtocol {

  func getPokemonList(result: @escaping (Result<[PokemonModel], Error>) -> Void) {
    self.remote.getPokemonList { remoteResponse in
      switch remoteResponse {
      case .success(let pokemonResponses):
        let resultList = PokemonMapper.mapPokemonResponsesToDomains(input: pokemonResponses)
        result(.success(resultList))
      case .failure(let error):
        result(.failure(error))
      }
    }
  }

}
