//
//  HomeView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import Core
import Pokemon

struct HomeView: View {

  @ObservedObject var presenter: GetListPresenter<
    Any,
    PokemonDomainModel,
    Interactor<Any,
               [PokemonDomainModel],
               GetPokemonsRepository<GetPokemonsLocaleDataSource, GetPokemonsRemoteDataSource, PokemonTransformer>>>

  @AppStorage("grid") var gridState = false

  private let gridItems = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]

  var body: some View {

    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
          ActivityIndicator()
        }
      } else {
        ZStack(alignment: .bottomTrailing) {
          ScrollView(.vertical, showsIndicators: false) {
            if gridState {
              LazyVGrid(columns: gridItems) {
                ForEach(self.presenter.list, id: \.id) { pokemon in
//                  ZStack {
//                    self.presenter.linkBuilder(for: pokemon) {
//                      PokemonGridRowView(pokemon: pokemon)
//                    }.buttonStyle(PlainButtonStyle())
                  ZStack {
                    linkBuilder(for: pokemon) {
                      PokemonGridRowView(pokemon: pokemon)
                    }.buttonStyle(PlainButtonStyle())
                  }
                }
              }.padding()
            } else {
              LazyVStack {
                ForEach(self.presenter.list, id: \.id) { pokemon in
//                  ZStack {
//                    self.presenter.linkBuilder(for: pokemon) {
//                      PokemonRowView(pokemon: pokemon)
//                    }.buttonStyle(PlainButtonStyle())
//                  }.padding(8)
                  ZStack {
                    linkBuilder(for: pokemon) {
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
      if self.presenter.list.isEmpty {
        self.presenter.getList(request: nil)
      }
    }
  }

  func linkBuilder<Content: View>(
      for pokemon: PokemonDomainModel,
      @ViewBuilder content: () -> Content
  ) -> some View {
      NavigationLink(
          destination: HomeRouter().makeInfoView(for: pokemon)
      ) { content() }
  }

}
