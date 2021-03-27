//
//  InfoPresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

class InfoPresenter: ObservableObject {

  private let infoUseCase: InfoUseCase

  @Published var pokemon: PokemonInfoModel?
  @Published var errorMessage = ""
  @Published var loadingState = false

  init(infoUseCase: InfoUseCase) {
    self.infoUseCase = infoUseCase
  }

  func getPokemonInfo(id: Int) {
    loadingState = true
    infoUseCase.getPokemonInfo(id: id) { result in
      switch result {
      case .success(let pokemon):
        DispatchQueue.main.async {
          self.loadingState = false
          self.pokemon = pokemon
        }
      case .failure(let error):
        DispatchQueue.main.async {
          self.loadingState = false
          self.errorMessage = error.localizedDescription
        }
      }
    }
  }

}
