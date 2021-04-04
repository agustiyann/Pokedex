//
//  InfoInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Combine

protocol InfoUseCase {
  func getPokemon() -> PokemonModel
  func getPokemon() -> AnyPublisher<PokemonModel, Error>
  func updateFavoritePokemon() -> AnyPublisher<PokemonModel, Error>
}

class InfoInteractor: InfoUseCase {

  private let repository: PokemonRepositoryProtocol
  private let pokemon: PokemonModel

  required init(repository: PokemonRepositoryProtocol, pokemon: PokemonModel) {
    self.repository = repository
    self.pokemon = pokemon
  }

  func getPokemon() -> PokemonModel {
    return pokemon
  }

  func getPokemon() -> AnyPublisher<PokemonModel, Error> {
    return repository.getPokemon(by: pokemon.num)
  }

  func updateFavoritePokemon() -> AnyPublisher<PokemonModel, Error> {
    return repository.updateFavoritePokemon(by: pokemon.num)
  }

}
