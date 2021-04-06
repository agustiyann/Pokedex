//
//  FavoritePresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI
import Combine

class FavoritePresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
  private let favoriteUseCase: FavoriteUseCase
  private let router = FavoriteRouter()

  @Published var pokemonList = [PokemonModel]()
  @Published var errorMessage = ""
  @Published var loadingState = false

  init(favoriteUseCase: FavoriteUseCase) {
    self.favoriteUseCase = favoriteUseCase
  }

  func getFavoriteList() {
    loadingState = true
    favoriteUseCase.getFavoritePokemonList()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { pokemonList in
        self.pokemonList = pokemonList
      }).store(in: &cancellables)
  }

//  func linkBuilder<Content: View>(
//    for pokemon: PokemonModel,
//    @ViewBuilder content: () -> Content
//  ) -> some View {
//    NavigationLink(destination: router.makeInfoView(for: pokemon)) { content() }
//  }

}
