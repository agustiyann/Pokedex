//
//  SearchRow.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct SearchRow: View {

  var pokemon: PokemonModel

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        ZStack {
          Rectangle()
            .frame(width: 120, height: 120)
            .foregroundColor(Color.backgroundType(type: pokemon.type[0]))
            .cornerRadius(10.0)
          imagePokemon
        }
        content
        Spacer()
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 8)

      Divider()
        .padding(.leading)
    }
  }
}

extension SearchRow {

  var imagePokemon: some View {
    WebImage(url: URL(string: pokemon.imageurl))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 100)
      .cornerRadius(20)
  }

  var content: some View {
    VStack(alignment: .leading) {
      Text(pokemon.name)
        .font(.title2)
        .bold()

      Text(pokemon.id)
        .foregroundColor(.gray)

      Text(pokemon.description)
        .lineLimit(3)
    }
    .frame(height: 120)
  }

}

struct SearchRow_Previews: PreviewProvider {
  static var previews: some View {
    SearchRow(pokemon: samplePokemon)
  }
}
