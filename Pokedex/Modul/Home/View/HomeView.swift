//
//  HomeView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct HomeView: View {

  @ObservedObject var presenter: HomePresenter
  @AppStorage("grid") var gridState = false
  private let gridItems = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {

    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
          ActivityIndicator()
        }
      } else {
        ZStack(alignment: .bottomTrailing) {
          ScrollView(.vertical, showsIndicators: false) {
            if gridState {
              LazyVGrid(columns: gridItems) {
                ForEach(self.presenter.pokemonList, id: \.id) { pokemon in
                  ZStack {
                    self.presenter.linkBuilder(for: pokemon) {
                      PokemonGridRowView(pokemon: pokemon)
                    }.buttonStyle(PlainButtonStyle())
                  }
                }
              }.padding()
            } else {
              LazyVStack {
                ForEach(self.presenter.pokemonList, id: \.id) { pokemon in
                  ZStack {
                    self.presenter.linkBuilder(for: pokemon) {
                      PokemonRowView(pokemon: pokemon)
                    }.buttonStyle(PlainButtonStyle())
                  }.padding(8)
                }
              }
            }
          }

          ActionButton(icon: gridState ? "list.bullet" : "square.grid.2x2.fill", backgroundColor: .blue) {
            gridState.toggle()
          }
          .padding()
        }
      }
    }
    .onAppear {
      if self.presenter.pokemonList.isEmpty {
        self.presenter.getPokemonList()
      }
    }
  }

}
