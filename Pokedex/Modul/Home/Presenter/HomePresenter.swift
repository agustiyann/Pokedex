//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

class HomePresenter: ObservableObject {

  private let homeUseCase: HomeUseCase

  @Published var pokemonList = [PokemonModel]()
  @Published var errorMessage = ""
  @Published var loadingState = false

  init(homeUseCase: HomeUseCase) {
    self.homeUseCase = homeUseCase
  }

  func getPokemonList() {
    loadingState = true
    homeUseCase.getPokemonList { result in
      switch result {
      case .success(let pokemonList):
        DispatchQueue.main.async {
          self.loadingState = false
          self.pokemonList = pokemonList
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
