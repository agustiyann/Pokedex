//
//  HomePresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import Combine

class HomePresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
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
    homeUseCase.getPokemonList()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { pokemons in
        self.pokemonList = pokemons
      })
      .store(in: &cancellables)
  }

  func linkBuilder<Content: View>(
    for pokemon: PokemonModel,
    @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeInfoView(for: pokemon)) { content() }
  }

}
