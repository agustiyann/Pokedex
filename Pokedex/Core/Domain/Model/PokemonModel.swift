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
  let num: String
  let description: String
  let img: String
  let height: String
  let weight: String
  let attack: Int
  let defense: Int
  let type: [String]
  let favoriteState: Bool
}

let samplePokemon = PokemonModel(
  id: 1,
  name: "Bulbasaur",
  num: "001",
  description: "Bulbasaur can be seen napping in bright sunlight.",
  img: "https://pokeres.bastionbot.org/images/pokemon/1.png",
  height: "0.71 m",
  weight: "6.9 kg",
  attack: 49,
  defense: 49,
  type: ["Grass", "Poison"],
  favoriteState: false
)
