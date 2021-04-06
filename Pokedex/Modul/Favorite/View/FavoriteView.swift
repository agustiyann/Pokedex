//
//  FavoriteView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI
import Core
import Pokemon

struct FavoriteView: View {

  @ObservedObject var presenter: GetListPresenter<
    String,
    PokemonDomainModel,
    Interactor<
      String,
      [PokemonDomainModel],
      GetFavoritePokemonsRepository<
        GetFavoritePokemonLocaleDataSource,
        PokemonsTransformer<PokemonTransformer>>>>

  var body: some View {
    ZStack {
      if presenter.isLoading {
        VStack {
          Text("Loading...")
          ActivityIndicator()
        }
      } else {
        if presenter.list.isEmpty {
          VStack {
            CustomEmptyView(
              image: "pokeball",
              title: "No favorite Pokemon!"
            ).offset(y: 50)
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
              ForEach(self.presenter.list, id: \.id) { pokemon in
                ZStack {
                  self.linkBuilder(for: pokemon) {
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
      self.presenter.getList(request: nil)
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
