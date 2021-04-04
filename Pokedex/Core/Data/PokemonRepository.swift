//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {

  func getPokemonList() -> AnyPublisher<[PokemonModel], Error>
  func getPokemon(by id: String) -> AnyPublisher<PokemonModel, Error>
  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error>
  func updateFavoritePokemon(by id: String) -> AnyPublisher<PokemonModel, Error>

}

final class PokemonRepository: NSObject {
  typealias PokemonInstance = (LocalDataSource, RemoteDataSource) -> PokemonRepository

  fileprivate let remote: RemoteDataSource
  fileprivate let locale: LocalDataSource

  private init(locale: LocalDataSource, remote: RemoteDataSource) {
    self.remote = remote
    self.locale = locale
  }

  static let sharedInstance: PokemonInstance = { localRepo, remoteRepo in
    return PokemonRepository(locale: localRepo, remote: remoteRepo)
  }
}

extension PokemonRepository: PokemonRepositoryProtocol {

  func getPokemonList() -> AnyPublisher<[PokemonModel], Error> {
    return self.locale.getPokemons()
      .flatMap { result -> AnyPublisher<[PokemonModel], Error> in
        if result.isEmpty {
          return self.remote.getPokemonList()
            .map { PokemonMapper.mapPokemonResponsesToEntities(input: $0) }
            .catch { _ in self.locale.getPokemons() }
            .flatMap { self.locale.addPokemons(from: $0) }
            .filter { $0 }
            .flatMap { _ in self.locale.getPokemons()
              .map { PokemonMapper.mapPokemonEntitiesToDomains(input: $0) }
            }.eraseToAnyPublisher()
        } else {
          return self.locale.getPokemons()
            .map { PokemonMapper.mapPokemonEntitiesToDomains(input: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }

  func getPokemon(by id: String) -> AnyPublisher<PokemonModel, Error> {
    return self.locale.getPokemon(by: id)
      .map { PokemonMapper.mapPokemonEntityToDomain(input: $0) }
      .eraseToAnyPublisher()
  }

  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error> {
    return self.locale.getFavoritePokemonList()
      .map { PokemonMapper.mapPokemonEntitiesToDomains(input: $0) }
      .eraseToAnyPublisher()
  }

  func updateFavoritePokemon(by id: String) -> AnyPublisher<PokemonModel, Error> {
    return self.locale.updateFavoritePokemon(by: id)
      .map { PokemonMapper.mapPokemonEntityToDomain(input: $0) }
      .eraseToAnyPublisher()
  }

}
