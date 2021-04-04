//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct PokemonResponse: Decodable {

  private enum CodingKeys: String, CodingKey {
    case id, name, imageurl, height, weight, hp, attack, defense, speed, total, cycles, weaknesses
    case description = "xdescription"
    case specialAttack = "special_attack"
    case specialDefense = "special_defense"
    case malePercentage = "male_percentage"
    case femalePercentage = "female_percentage"
    case eggGroups = "egg_groups"
    case type = "typeofpokemon"
  }

  let id: String?
  let name: String?
  let description: String?
  let imageurl: String?
  let height: String?
  let weight: String?
  let hp: Int?
  let attack: Int?
  let defense: Int?
  let specialAttack: Int?
  let specialDefense: Int?
  let speed: Int?
  let total: Int?
  let malePercentage: String?
  let femalePercentage: String?
  let cycles: String?
  let eggGroups: String?
  let type: [String]
  let weaknesses: [String]

}
