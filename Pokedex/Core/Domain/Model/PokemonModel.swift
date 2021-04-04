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

let samplePokemon = PokemonModel(
  id: "#001",
  name: "Bulbasaur",
  description: "Bulbasaur can be seen napping in bright sunlight.",
  imageurl: "https://pokeres.bastionbot.org/images/pokemon/1.png",
  height: "0.71 m",
  weight: "6.9 kg",
  hp: 20,
  attack: 30,
  defense: 20,
  specialAttack: 30,
  specialDefense: 30,
  speed: 30,
  total: 160,
  malePercentage: "87.5",
  femalePercentage: "66.8",
  cycles: "20",
  eggGroups: "Grass",
  type: ["Grass", "Poison"],
  weaknesses: ["Fire", "Ice"],
  favoriteState: false
)
