//
//  PokemonModel.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct PokemonModel: Equatable {
  let id: String
  let name: String
  let description: String
  let imageurl: String
  let height: String
  let weight: String
  let hp: Int
  let attack: Int
  let defense: Int
  let specialAttack: Int
  let specialDefense: Int
  let speed: Int
  let total: Int
  let malePercentage: String
  let femalePercentage: String
  let cycles: String
  let eggGroups: String
  let type: [String]
  let weaknesses: [String]
  let favoriteState: Bool
}
