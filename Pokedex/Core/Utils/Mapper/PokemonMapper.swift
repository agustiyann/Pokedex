//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

final class PokemonMapper {

  static func mapPokemonResponsesToDomains(input pokemonResponses: [PokemonResponse]) -> [PokemonModel] {
    return pokemonResponses.map { result in
      return PokemonModel(
        id: result.id ?? 0,
        name: result.name ?? "Unknow",
        num: result.num ?? "000",
        description: result.description ?? "Unknow",
        img: result.img ?? "Unknow",
        height: result.height ?? "Unknow",
        weight: result.weight ?? "Unknow",
        attack: result.attack ?? 0,
        defense: result.defense ?? 0,
        type: result.type
      )
    }
  }

}
