//
//  PokemonDetailResponse.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct PokemonInfoResponse: Decodable {
  let id: Int?
  let name: String?
  let height: Int?
  let weight: Int?
}

struct StatList: Decodable {
  let stats: [Stats]
}

struct Stats: Decodable {
  let baseStat: Int?
  let name: String?
  let stat: Stat

  private enum CodingKeys: String, CodingKey {
    case baseStat = "base_stat"
    case name
    case stat
  }
}

struct Stat: Decodable {
  let name: String?
}
