//
//  SearchInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import Foundation
import Combine

protocol SearchUseCase {
  func searchPokemon(by name: String) -> AnyPublisher<[PokemonModel], Error>
}

class SearchInteractor: SearchUseCase {
  private let repository: PokemonRepositoryProtocol

  required init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  func searchPokemon(by name: String) -> AnyPublisher<[PokemonModel], Error> {
    return repository.searchPokemon(by: name)
  }
}
