//
//  InfoPresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

class InfoPresenter: ObservableObject {

  private let infoUseCase: InfoUseCase

  @Published var pokemon: PokemonModel
  @Published var errorMessage = ""
  @Published var loadingState = false

  init(infoUseCase: InfoUseCase) {
    self.infoUseCase = infoUseCase
    pokemon = infoUseCase.getPokemonInfo()
  }

}
