//
//  BarView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import SwiftUI

struct BarView: View {
  var value: Int = 100
  var title: String = "HP"
  var color: Color = .blue

  var body: some View {

    HStack(alignment: .center) {
      Text(title)
        .foregroundColor(.gray)

      HStack {
        Text("\(value)")
          .frame(width: 40)

        ZStack(alignment: .leading) {
          Capsule()
            .frame(width: 180, height: 20).animation(.default)
            .foregroundColor(Color(.systemGray5))

          Capsule()
            .frame(width: value > 250 ? CGFloat(200) : CGFloat(value), height: 20).animation(.default)
            .foregroundColor(color)
        }
      }
    }
  }
}

struct BarChartView: View {
  let pokemon: PokemonModel
  var body: some View {
    VStack {
      BarView(value: pokemon.attack, title: "ATK", color: .red)
      BarView(value: pokemon.defense, title: "DEF", color: .blue)
    }
  }
}

struct BarView_Previews: PreviewProvider {
  static var previews: some View {
    BarView()
    BarChartView(pokemon: samplePokemon)
  }
}
