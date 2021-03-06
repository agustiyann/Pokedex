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
      return "Pokédex"
    case .search:
      return "Search"
    case .favorite:
      return "Favorite"
    case .profile:
      return "Profile"
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
      GetPokemonsRepository<
        GetPokemonsLocaleDataSource,
        GetPokemonsRemoteDataSource,
        PokemonsTransformer<PokemonTransformer>>
    >>

  @EnvironmentObject var favoritePresenter: GetListPresenter<
    String,
    PokemonDomainModel,
    Interactor<
      String,
      [PokemonDomainModel],
      GetFavoritePokemonsRepository<
        GetFavoritePokemonLocaleDataSource,
        PokemonsTransformer<PokemonTransformer>>
    >>

  @EnvironmentObject var aboutPresenter: AboutPresenter
  @EnvironmentObject var searchPresenter: SearchPresenter<
    PokemonDomainModel,
    Interactor<
      String,
      [PokemonDomainModel],
      SearchPokemonsRepository<GetSearchPokemonLocaleDataSource, PokemonsTransformer<PokemonTransformer>>>>

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
    .accentColor(.yellow)
  }
}
