//
//  InfoView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct InfoView: View {

  @ObservedObject var presenter: InfoPresenter
  var id: Int

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
        }
      } else {
        ScrollView(.vertical) {
          VStack {
            Text(self.presenter.pokemon?.name ?? "Unknow")
            Text(String(self.presenter.pokemon?.height ?? 0))
          }
        }
      }
    }
    .onAppear {
      self.presenter.getPokemonInfo(id: id)
    }
  }

}
