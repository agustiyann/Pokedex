//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct PokemonModel: Equatable {
  let id: Int
  let name: String
  let img: String
  let height: String
  let weight: String
  let attack: Int
  let defense: Int
  let type: [String]
}
