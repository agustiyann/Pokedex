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

  var body: some View {
    VStack {
      imageCategory
      content
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.random)
    .cornerRadius(30)
  }

}

extension PokemonRowView {

  var imageCategory: some View {
    WebImage(url: URL(string: self.pokemon.img))
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

struct PokemonRowView_Previews: PreviewProvider {
  static var previews: some View {
    let pokemon = PokemonModel(
      id: 1,
      name: "Bulbasaur",
      img: "https://pokeres.bastionbot.org/images/pokemon/1.png",
      height: "1 m",
      weight: "10 kg",
      attack: 70,
      defense: 80,
      type: ["Grass", "Poison"]
    )
    PokemonRowView(pokemon: pokemon)
  }
}
