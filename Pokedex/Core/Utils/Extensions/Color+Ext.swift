//
//  Color+Ext.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

extension Color {

  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }

  static func backgroundType(type: String) -> Color {
    switch type {
    case "Grass": return .green
    case "Fire": return .red
    case "Poison", "bug": return .purple
    case "Water": return .blue
    case "Electric": return .yellow
    case "Psychic": return .purple
    case "Normal": return .orange
    case "Flying": return .blue
    case "Fairy": return .pink
    default: return .green
    }
  }

}
