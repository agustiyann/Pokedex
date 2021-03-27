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

}
