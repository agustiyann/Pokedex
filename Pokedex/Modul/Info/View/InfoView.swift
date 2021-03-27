//
//  InfoView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct InfoView: View {

  @ObservedObject var presenter: InfoPresenter

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
        }
      } else {
        ScrollView(.vertical) {
          VStack {
            Text(self.presenter.pokemon.name)
            Text(String(self.presenter.pokemon.height))
          }
        }
      }
    }
  }

}
