//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

class HomePresenter: ObservableObject {

  private let router = HomeRouter()
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

  func linkBuilder<Content: View>(
    for pokemon: PokemonModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeInfoView(for: pokemon)) { content() }
  }

}
