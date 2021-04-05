//
//  PokemonGridRowView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonGridRowView: View {

  var pokemon: PokemonModel

  var body: some View {
    ZStack {
      VStack {
        imagePokemon
        content
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.backgroundType(type: self.pokemon.type[0]))
      .cornerRadius(12)
      .padding(4)
    }
  }
}

extension PokemonGridRowView {

  var imagePokemon: some View {
    WebImage(url: URL(string: self.pokemon.imageurl))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 100)
      .cornerRadius(30)
      .shadow(color: .black, radius: 5, x: 0, y: 5)
      .padding(.top)
  }

  var content: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(pokemon.name)
        .font(.title2)
        .foregroundColor(.white)
        .bold()
        .lineLimit(1)
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

struct PokemonGridRowView_Previews: PreviewProvider {
  static var previews: some View {
    PokemonGridRowView(pokemon: samplePokemon)
  }
}
