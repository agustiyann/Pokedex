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
    let pokemonUseCase: Interactor<
      String,
      [PokemonDomainModel],
      GetPokemonsRepository<
        GetPokemonsLocaleDataSource,
        GetPokemonsRemoteDataSource,
        PokemonsTransformer<PokemonTransformer>>
    > = Injection.init().providePokemon()

    let favoriteUseCase = Injection.init().provideFavorite()
    let searchUseCase = Injection.init().provideSearch()

    let homePresenter = GetListPresenter(useCase: pokemonUseCase)
    let favoritePresenter = FavoritePresenter(favoriteUseCase: favoriteUseCase)
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
