//
//  HomeUseCase.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

protocol HomeUseCase {
  func getPokemonList(completion: @escaping (Result<[PokemonModel], Error>) -> Void)
}

class HomeInteractor: HomeUseCase {

  private let repository: PokemonRepositoryProtocol

  required init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  func getPokemonList(completion: @escaping (Result<[PokemonModel], Error>) -> Void) {
    repository.getPokemonList { result in
      completion(result)
    }
  }
}
