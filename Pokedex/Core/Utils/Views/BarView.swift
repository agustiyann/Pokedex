//
//  BarView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import SwiftUI
import Pokemon

struct BarView: View {
  var value: Int = 100
  var title: String = "HP"
  var color: Color = .blue
  var maxValue: Int = 100

  var body: some View {
    HStack(alignment: .center) {
      Text(title)
        .foregroundColor(.gray)

      HStack {
        Text("\(value)")
          .frame(width: 40)

        ProgressView(value: Float(value), total: Float(maxValue))
          .accentColor(color)
          .scaleEffect(x: 1, y: 4, anchor: .center)
      }
    }
    .padding(.horizontal)
  }
}

struct BarChartView: View {
  let pokemon: PokemonDomainModel
  var body: some View {
    VStack(alignment: .leading) {
      BarView(value: pokemon.hp, title: "HP\t\t", color: .green)
      BarView(value: pokemon.attack, title: "ATK\t", color: .red)
      BarView(value: pokemon.defense, title: "DEF\t", color: .blue)
      BarView(value: pokemon.specialAttack, title: "S.ATK\t", color: .red)
      BarView(value: pokemon.specialDefense, title: "S.DEF\t", color: .blue)
      BarView(value: pokemon.speed, title: "SPD\t", color: .orange)
      BarView(value: pokemon.total, title: "TOT\t", color: .blue, maxValue: 600)
    }
  }
}

//struct BarView_Previews: PreviewProvider {
//  static var previews: some View {
//    BarChartView(pokemon: samplePokemon)
//  }
//}
