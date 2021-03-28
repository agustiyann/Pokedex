//
//  InfoInteractor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Combine

protocol InfoUseCase {
  func getPokemonInfo() -> PokemonModel
  func getPokemon() -> AnyPublisher<PokemonModel, Error>
  func addPokemonFavorite() -> AnyPublisher<Bool, Error>
  func removePokemonFavorite() -> AnyPublisher<Bool, Error>
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

  func getPokemon() -> AnyPublisher<PokemonModel, Error> {
    return repository.getPokemon(by: pokemon.num)
  }

  func addPokemonFavorite() -> AnyPublisher<Bool, Error> {
    return repository.addPokemonFavorite(from: pokemon)
  }

  func removePokemonFavorite() -> AnyPublisher<Bool, Error> {
    return repository.removePokemonFavorite(from: pokemon)
  }

}
