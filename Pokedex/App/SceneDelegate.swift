//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import UIKit
import SwiftUI
import Core
import Pokemon

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    let injection = Injection()

    let pokemonUseCase: Interactor<
      String,
      [PokemonDomainModel],
      GetPokemonsRepository<
        GetPokemonsLocaleDataSource,
        GetPokemonsRemoteDataSource,
        PokemonsTransformer<PokemonTransformer>>
    > = injection.providePokemon()

    let favoriteUseCase: Interactor<
      String,
      [PokemonDomainModel],
      GetFavoritePokemonsRepository<
        GetFavoritePokemonLocaleDataSource,
        PokemonsTransformer<PokemonTransformer>>
    > = injection.provideFavorite()

    let searchUseCase = Injection.init().provideSearch()

    let homePresenter = GetListPresenter(useCase: pokemonUseCase)
    let favoritePresenter = GetListPresenter(useCase: favoriteUseCase)
    let aboutPresenter = AboutPresenter()
    let searchPresenter = SearchPresenter(searchUseCase: searchUseCase)

    let contentView = ContentView()
      .environmentObject(homePresenter)
      .environmentObject(favoritePresenter)
      .environmentObject(aboutPresenter)
      .environmentObject(searchPresenter)

    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }

}
