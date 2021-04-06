//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Core
import Pokemon

struct PokemonRowView: View {

  var pokemon: PokemonDomainModel

  var body: some View {
    VStack {
      imagePokemon
      content
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.backgroundType(type: self.pokemon.type[0]))
    .cornerRadius(30)
  }

}

extension PokemonRowView {

  var imagePokemon: some View {
    WebImage(url: URL(string: self.pokemon.imageurl))
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
    VStack(alignment: .leading, spacing: 10) {
      Text(pokemon.name)
        .font(.title)
        .foregroundColor(.white)
        .bold()
        .shadow(color: .black, radius: 5, x: 0, y: 0)
    }.padding(
      EdgeInsets(
        top: 0,
        leading: 16,
        bottom: 16,
        trailing: 16
      )
    )
  }

}
