//
//  ContentView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import Core
import Pokemon

enum TabTag {
  case home, search, favorite, profile

  var title: String {
    switch self {
    case .home:
      return "Pokedex"
    case .search:
      return "Search"
    case .favorite:
      return "Favorite"
    case .profile:
      return "About"
    }
  }
}

struct ContentView: View {

  @EnvironmentObject var homePresenter: GetListPresenter<
    String,
    PokemonDomainModel,
    Interactor<
      String,
      [PokemonDomainModel],
      GetPokemonsRepository<GetPokemonsLocaleDataSource, GetPokemonsRemoteDataSource, PokemonsTransformer<PokemonTransformer>>
    >
  >
  @EnvironmentObject var favoritePresenter: FavoritePresenter
  @EnvironmentObject var aboutPresenter: AboutPresenter
  @EnvironmentObject var searchPresenter: SearchPresenter

  @State var selectedTab = TabTag.home

  var body: some View {
    NavigationView {
      TabView(selection: $selectedTab) {
        HomeView(presenter: homePresenter)
          .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
          }.tag(TabTag.home)
        SearchView(presenter: searchPresenter)
          .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Search")
          }.tag(TabTag.search)
        FavoriteView(presenter: favoritePresenter)
          .tabItem {
              Image(systemName: "heart.fill")
              Text("Favorite")
          }.tag(TabTag.favorite)
        AboutView(presenter: aboutPresenter)
          .tabItem {
              Image(systemName: "person.circle.fill")
              Text("Profile")
          }.tag(TabTag.profile)
      }
      .navigationBarTitle(selectedTab.title, displayMode: .large)
    }
  }
}
