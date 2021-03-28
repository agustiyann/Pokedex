//
//  HomeUseCase.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Combine

protocol HomeUseCase {
  func getPokemonList() -> AnyPublisher<[PokemonModel], Error>
}

class HomeInteractor: HomeUseCase {

  private let repository: PokemonRepositoryProtocol

  required init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  func getPokemonList() -> AnyPublisher<[PokemonModel], Error> {
    return repository.getPokemonList()
  }
}
