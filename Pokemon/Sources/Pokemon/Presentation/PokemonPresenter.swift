//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 06/04/21.
//

import Foundation
import Combine
import Core

public class PokemonPresenter<PokemonUseCase: UseCase, FavoriteUseCase: UseCase>: ObservableObject
where
  PokemonUseCase.Request == String, PokemonUseCase.Response == PokemonDomainModel,
  FavoriteUseCase.Request == String, FavoriteUseCase.Response == PokemonDomainModel
{
  private var cancellables: Set<AnyCancellable> = []

  private let _pokemonUseCase: PokemonUseCase
  private let _favoriteUseCase: FavoriteUseCase

  @Published public var item: PokemonDomainModel?
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false

  public init(pokemonUseCase: PokemonUseCase, favoriteUseCase: FavoriteUseCase) {
    _pokemonUseCase = pokemonUseCase
    _favoriteUseCase = favoriteUseCase
  }

  public func getPokemon(request: PokemonUseCase.Request) {
    isLoading = true
    _pokemonUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure (let error):
          self.errorMessage = error.localizedDescription
          self.isError = true
          self.isLoading = false
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { item in
        self.item = item
      })
      .store(in: &cancellables)
  }

  public func updateFavoritePokemon(request: FavoriteUseCase.Request) {
    _favoriteUseCase.execute(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { completion in
        switch completion {
        case .failure:
          self.errorMessage = String(describing: completion)
        case .finished:
          self.isLoading = false
        }
      }, receiveValue: { item in
        self.item = item
      })
      .store(in: &cancellables)
  }

}
