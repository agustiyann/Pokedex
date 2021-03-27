//
//  HomeView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct HomeView: View {

  @ObservedObject var presenter: HomePresenter

  var body: some View {

    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
        }
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          ForEach(self.presenter.pokemonList.indices) { index in
            ZStack {
              self.presenter.linkBuilder(for: index + 1) {
                PokemonRowView(pokemon: self.presenter.pokemonList[index], index: index + 1)
              }.buttonStyle(PlainButtonStyle())
            }.padding(8)
          }
        }
      }
    }
    .onAppear {
      if self.presenter.pokemonList.isEmpty {
        self.presenter.getPokemonList()
      }
    }
    .navigationBarTitle(Text("Pokedex"), displayMode: .automatic)

  }
}
