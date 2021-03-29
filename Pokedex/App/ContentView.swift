//
//  ContentView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct ContentView: View {

  @EnvironmentObject var homePresenter: HomePresenter

  var body: some View {
    TabView {
      HomeView(presenter: homePresenter)
        .tabItem {
          Image(systemName: "house.fill")
          Text("Home")
        }
      FavoriteView()
        .tabItem {
            Image(systemName: "heart.fill")
            Text("Favorite")
        }
      AboutView()
        .tabItem {
            Image(systemName: "person.circle.fill")
            Text("Profile")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
