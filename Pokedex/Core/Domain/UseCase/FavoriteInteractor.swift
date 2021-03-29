//
//  FavoriteInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import Foundation
import Combine

protocol FavoriteUseCase {
  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error>
}

class FavoriteInteractor: FavoriteUseCase {

  private let repository: PokemonRepositoryProtocol

  required init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  func getFavoritePokemonList() -> AnyPublisher<[PokemonModel], Error> {
    return repository.getFavoritePokemonList()
  }
}
