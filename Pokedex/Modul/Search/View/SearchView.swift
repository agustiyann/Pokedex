//
//  SearchView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI

struct SearchView: View {

  @ObservedObject var presenter: SearchPresenter

  var body: some View {
    VStack {
      SearchBar(placeHolder: "Search Pokemon", text: self.$presenter.name)
        .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))

      ZStack {
        if presenter.isLoading {
          loadingIndicator
        } else if presenter.name.isEmpty {
          emptyName
        } else if presenter.pokemons.isEmpty {
          emptyPokemons
        } else if presenter.isError {
          errorIndicator
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
              ForEach(self.presenter.pokemons, id: \.id) { pokemon in
//                ZStack {
//                  self.presenter.linkBuilder(for: pokemon) {
//                    SearchRow(pokemon: pokemon)
//                  }.buttonStyle(PlainButtonStyle())
//                }.padding(8)
              }
            }
          }
        }
      }
      Spacer()
    }
  }
}

extension SearchView {

  var loadingIndicator: some View {
    VStack {
      VStack {
        Text("Loading...")
        ActivityIndicator()
      }
    }
  }

  var errorIndicator: some View {
    CustomEmptyView(
      image: "pokeball",
      title: presenter.errorMessage
    ).offset(y: 80)
  }

  var emptyName: some View {
    CustomEmptyView(
      image: "pokeball",
      title: "Come on, find your favorite Pokemon!"
    ).offset(y: 50)
  }

  var emptyPokemons: some View {
    CustomEmptyView(
      image: "pokeball",
      title: "Data not found"
    ).offset(y: 80)
  }

}
