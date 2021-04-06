//
//  FavoriteView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct FavoriteView: View {

  @ObservedObject var presenter: FavoritePresenter

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ActivityIndicator()
        }
      } else {
        if presenter.pokemonList.isEmpty {
          VStack {
            CustomEmptyView(
              image: "pokeball",
              title: "No favorite Pokemon!"
            ).offset(y: 50)
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
              ForEach(self.presenter.pokemonList, id: \.id) { pokemon in
                ZStack {
                  self.presenter.linkBuilder(for: pokemon) {
                    PokemonFavoriteRow(pokemon: pokemon)
                  }.buttonStyle(PlainButtonStyle())
                }.padding(8)
              }
            }
          }
        }
      }
    }
    .onAppear {
      self.presenter.getFavoriteList()
    }
  }
}
