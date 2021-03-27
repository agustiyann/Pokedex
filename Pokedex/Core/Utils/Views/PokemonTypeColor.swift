//
//  PokemonTypeColor.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import SwiftUI

struct PokemonTypeColor {
  let type: String

  var backgroundColor: Color {
    switch type {
    case "fire": return .red
    case "poison", "bug": return .green
    case "water": return .blue
    case "electric": return .yellow
    case "psychic": return .purple
    case "normal": return .orange
    case "ground": return .gray
    case "flying": return .blue
    case "fairy": return .pink
    default: return .green
    }
  }

  init(type: String) {
    self.type = type
  }
}
