//
//  ContentView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

enum TabTag {
  case first, second, third

  var title: String {
    switch self {
    case .first:
      return "Pokedex"
    case .second:
      return "Favorite"
    case .third:
      return "About"
    }
  }
}

struct ContentView: View {

  @EnvironmentObject var homePresenter: HomePresenter
  @EnvironmentObject var favoritePresenter: FavoritePresenter

  @State var selectedTab = TabTag.first

  var body: some View {
    NavigationView {
      TabView(selection: $selectedTab) {
        HomeView(presenter: homePresenter)
          .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
          }.tag(TabTag.first)
        FavoriteView(presenter: favoritePresenter)
          .tabItem {
              Image(systemName: "heart.fill")
              Text("Favorite")
          }.tag(TabTag.second)
        AboutView()
          .tabItem {
              Image(systemName: "person.circle.fill")
              Text("Profile")
          }.tag(TabTag.third)
      }
      .navigationBarTitle(selectedTab.title, displayMode: .automatic)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
