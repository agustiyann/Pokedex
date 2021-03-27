//
//  InfoInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

protocol InfoUseCase {
  func getPokemonInfo() -> PokemonModel
}

class InfoInteractor: InfoUseCase {

  private let repository: PokemonRepositoryProtocol
  private let pokemon: PokemonModel

  required init(repository: PokemonRepositoryProtocol, pokemon: PokemonModel) {
    self.repository = repository
    self.pokemon = pokemon
  }

  func getPokemonInfo() -> PokemonModel {
    return pokemon
  }

}
