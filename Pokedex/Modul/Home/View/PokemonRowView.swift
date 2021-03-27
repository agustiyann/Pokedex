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
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.gray)
    .cornerRadius(30)
  }

  private func setImageUrl(for indexImage: Int) -> String {
    let imagePathUrl = "https://pokeres.bastionbot.org/images/pokemon/"
    return "\(imagePathUrl)\(indexImage).png"
  }

}

extension PokemonRowView {

  var imageCategory: some View {
    WebImage(url: URL(string: self.setImageUrl(for: self.index)))
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
        .foregroundColor(.white)
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
