//
//  SearchPresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI
import Combine

class SearchPresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
  private let searchUseCase: SearchUseCase
  private let router = SearchRouter()

  @Published var pokemons: [PokemonModel] = []
  @Published var errorMessage: String = ""
  @Published var isLoading: Bool = false
  @Published var isError: Bool = false
  @Published var name = "" {
    didSet {
      self.searchPokemon()
    }
  }

  init(searchUseCase: SearchUseCase) {
    self.searchUseCase = searchUseCase
  }

  func searchPokemon() {
    isLoading = true
    searchUseCase.searchPokemon(by: self.name)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { pokemons in
        self.pokemons = pokemons
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
