//
//  Color+Ext.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

extension Color {

  init(hex string: String) {
    var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    if string.hasPrefix("#") {
      _ = string.removeFirst()
    }

    if !string.count.isMultiple(of: 2), let last = string.last {
      string.append(last)
    }

    if string.count > 8 {
      string = String(string.prefix(8))
    }

    let scanner = Scanner(string: string)
    var color: UInt64 = 0
    scanner.scanHexInt64(&color)

    if string.count == 2 {
      let mask = 0xFF
      let gMask = Int(color) & mask
      let gray = Double(gMask) / 255.0

      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

    } else if string.count == 4 {
      let mask = 0x00FF
      let gMask = Int(color >> 8) & mask
      let aMask = Int(color) & mask
      let gray = Double(gMask) / 255.0
      let alpha = Double(aMask) / 255.0

      self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

    } else if string.count == 6 {
      let mask = 0x0000FF
      let rMask = Int(color >> 16) & mask
      let gMask = Int(color >> 8) & mask
      let bMask = Int(color) & mask

      let red = Double(rMask) / 255.0
      let green = Double(gMask) / 255.0
      let blue = Double(bMask) / 255.0

      self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

    } else if string.count == 8 {
      let mask = 0x000000FF
      let rMask = Int(color >> 24) & mask
      let gMask = Int(color >> 16) & mask
      let bMask = Int(color >> 8) & mask
      let aMask = Int(color) & mask

      let red = Double(rMask) / 255.0
      let green = Double(gMask) / 255.0
      let blue = Double(bMask) / 255.0
      let alpha = Double(aMask) / 255.0

      self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

    } else {
      self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
    }
  }

  static func backgroundType(type: String) -> Color {
    switch type {
    case "Bug": return Color(hex: "#A8B820")
    case "Dark": return Color(hex: "#705848")
    case "Dragon": return Color(hex: "7038F8")
    case "Electric": return Color(hex: "#F8D030")
    case "Fairy": return Color(hex: "#EE99AC")
    case "Fighting": return Color(hex: "#C03028")
    case "Fire": return Color(hex: "#F08030")
    case "Flying": return Color(hex: "#A890F0")
    case "Ghost": return Color(hex: "#705898")
    case "Grass": return Color(hex: "#78C850")
    case "Ground": return Color(hex: "#E0C068")
    case "Ice": return Color(hex: "#98D8D8")
    case "Normal": return Color(hex: "#A8A878")
    case "Poison": return Color(hex: "#A040A0")
    case "Psychic": return Color(hex: "#F85888")
    case "Rock": return Color(hex: "#B8A038")
    case "Steel": return Color(hex: "#B8B8D0")
    case "Water": return Color(hex: "#6890F0")
    default: return .green
    }
  }

}
