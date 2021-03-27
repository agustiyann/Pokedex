//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonRowView: View {

  var pokemon: PokemonModel
  var index: Int

  var body: some View {
    VStack {
      imageCategory
      content
    }
  }
}

extension PokemonRowView {

  var imageCategory: some View {
    WebImage(url: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(self.index).png"))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(30)
      .padding(.top)
  }

  var content: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(pokemon.name)
        .font(.title)
        .bold()
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

struct PokemonRowView_Previews: PreviewProvider {
  static var previews: some View {
    let pokemon = PokemonModel(name: "bulbasaur")
    PokemonRowView(pokemon: pokemon, index: 1)
  }
}
