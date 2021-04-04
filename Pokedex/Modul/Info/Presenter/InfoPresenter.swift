//
//  InfoPresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import Combine

class InfoPresenter: ObservableObject {

  private var cancellables: Set<AnyCancellable> = []
  private let infoUseCase: InfoUseCase

  @Published var pokemon: PokemonModel
  @Published var errorMessage = ""
  @Published var loadingState = false

  init(infoUseCase: InfoUseCase) {
    self.infoUseCase = infoUseCase
    pokemon = infoUseCase.getPokemon()
  }

  func getPokemon() {
    loadingState = true
    infoUseCase.getPokemon()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.loadingState = false
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { pokemon in
        self.pokemon = pokemon
      }).store(in: &cancellables)
  }

  func updateFavoritePokemon() {
    infoUseCase.updateFavoritePokemon()
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.loadingState = false
        }
      }, receiveValue: { pokemon in
        self.pokemon = pokemon
      })
      .store(in: &cancellables)
  }

}
