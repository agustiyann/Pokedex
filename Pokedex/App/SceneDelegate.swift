//
//  SceneDelegate.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {

    let homeUseCase = Injection.init().provideHome()
    let favoriteUseCase = Injection.init().provideFavorite()
    let searchUseCase = Injection.init().provideSearch()

    let homePresenter = HomePresenter(homeUseCase: homeUseCase)
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
