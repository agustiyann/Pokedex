//
//  InfoInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

protocol InfoUseCase {
  func getPokemonInfo(id: Int, completion: @escaping (Result<PokemonInfoModel, Error>) -> Void)
}

class InfoInteractor: InfoUseCase {

  private let repository: PokemonRepositoryProtocol

  required init(repository: PokemonRepositoryProtocol) {
    self.repository = repository
  }

  func getPokemonInfo(id: Int, completion: @escaping (Result<PokemonInfoModel, Error>) -> Void) {
    repository.getPokemonInfo(id: id) { result in
      completion(result)
    }
  }

}
