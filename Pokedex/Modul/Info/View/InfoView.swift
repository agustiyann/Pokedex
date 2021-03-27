//
//  InfoView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct InfoView: View {

  @ObservedObject var presenter: InfoPresenter

  var body: some View {
    ZStack {
      if presenter.loadingState {
        VStack {
          Text("Loading...")
        }
      } else {
        ZStack {
          LinearGradient(gradient: Gradient(colors: [Color.random, Color.white]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
          Color.white.offset(y: 300)
          ScrollView(.vertical) {
            imagePokemon
            content
          }
        }
      }
    }
  }

}

extension InfoView {

  var imagePokemon: some View {
    WebImage(url: URL(string: self.presenter.pokemon.img))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(30)
      .shadow(color: .black, radius: 5, x: 0, y: 5)
      .padding(.top)
  }

  var content: some View {
    VStack(alignment: .center, spacing: 15) {
      Text(self.presenter.pokemon.name)
        .font(.title)
        .bold()
        .padding(.top, 40)

      HStack(alignment: .center, spacing: 25) {
        ForEach(self.presenter.pokemon.type, id: \.self) { type in
          Text(type)
            .bold()
            .foregroundColor(Color.white)
            .padding(EdgeInsets(top: 5, leading: 35, bottom: 5, trailing: 35))
            .background(Color.backgroundType(type: type))
            .cornerRadius(40)
        }
      }

      HStack { Spacer() }
    }
    .background(Color.white)
    .cornerRadius(40)
    .padding(.top, -40)
    .zIndex(-1)
  }

}
