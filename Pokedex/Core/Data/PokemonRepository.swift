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
  func getPokemon(by num: String) -> AnyPublisher<PokemonModel, Error>
  func addPokemonFavorite(from pokemon: PokemonModel) -> AnyPublisher<Bool, Error>
  func removePokemonFavorite(from pokemon: PokemonModel) -> AnyPublisher<Bool, Error>
  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error>

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
    return self.remote.getPokemonList()
      .map { PokemonMapper.mapPokemonResponsesToDomains(input: $0) }
      .eraseToAnyPublisher()
  }

  func getPokemon(by num: String) -> AnyPublisher<PokemonModel, Error> {
    return self.locale.getArticle(by: num)
      .map { PokemonMapper.mapPokemonEntityToDomain(input: $0) }
      .eraseToAnyPublisher()
  }

  func addPokemonFavorite(from pokemon: PokemonModel) -> AnyPublisher<Bool, Error> {
    let pokemonEntity = PokemonMapper.mapPokemonDomainToEntity(input: pokemon)
    return self.locale.addPokemonFavorite(from: pokemonEntity)
      .eraseToAnyPublisher()
  }

  func removePokemonFavorite(from pokemon: PokemonModel) -> AnyPublisher<Bool, Error> {
    let pokemonEntity = PokemonMapper.mapPokemonDomainToEntity(input: pokemon)
    return self.locale.removePokemonFavorite(from: pokemonEntity)
      .eraseToAnyPublisher()
  }

  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error> {
    return self.locale.getFavoritePokemonList()
      .map { PokemonMapper.mapPokemonEntitiesToDomains(input: $0) }
      .eraseToAnyPublisher()
  }

}
