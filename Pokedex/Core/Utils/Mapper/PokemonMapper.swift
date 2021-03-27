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
      return PokemonModel(name: result.name ?? "Unknow")
    }
  }

  static func mapPokemonInfoResponseToDomain(input pokemonResponse: PokemonInfoResponse) -> PokemonInfoModel {
    return PokemonInfoModel(id: pokemonResponse.id ?? 0,
                            name: pokemonResponse.name ?? "Unknow",
                            height: pokemonResponse.height ?? 0,
                            weight: pokemonResponse.weight ?? 0)
  }

}
