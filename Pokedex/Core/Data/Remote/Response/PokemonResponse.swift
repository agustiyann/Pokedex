//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

struct PokemonsResponse: Decodable {
  let results: [PokemonResponse]
}

struct PokemonResponse: Decodable {
  let name: String?
}
