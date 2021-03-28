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

  func getPokemonList(result: @escaping (Result<[PokemonModel], Error>) -> Void) {
    locale.getPokemonList { localeResponses in
      switch localeResponses {
      case .success(let pokemonEntity):
        let pokemonList = PokemonMapper.mapPokemonEntitiesToDomains(input: pokemonEntity)
        if pokemonList.isEmpty {
          self.remote.getPokemonList { remoteResponse in
            switch remoteResponse {
            case .success(let pokemonResponses):
              let pokemonEntities = PokemonMapper.mapPokemonResponsesToEntities(input: pokemonResponses)
              self.locale.addPokemons(from: pokemonEntities) { addState in
                switch addState {
                case .success(let resultFromAdd):
                  if resultFromAdd {
                    self.locale.getPokemonList { localeResponses in
                      switch localeResponses {
                      case .success(let pokemonEntity):
                        let resultList = PokemonMapper.mapPokemonEntitiesToDomains(input: pokemonEntity)
                        result(.success(resultList))
                      case .failure(let error):
                        result(.failure(error))
                      }
                    }
                  }
                case .failure(let error):
                  result(.failure(error))
                }
              }
            case .failure(let error):
              result(.failure(error))
            }
          }
        } else {
          result(.success(pokemonList))
        }
      case .failure(let error):
        result(.failure(error))
      }
    }
  }

//  func getPokemonList(result: @escaping (Result<[PokemonModel], Error>) -> Void) {
//    self.remote.getPokemonList { remoteResponse in
//      switch remoteResponse {
//      case .success(let pokemonResponses):
//        let resultList = PokemonMapper.mapPokemonResponsesToDomains(input: pokemonResponses)
//        result(.success(resultList))
//      case .failure(let error):
//        result(.failure(error))
//      }
//    }
//  }

}
