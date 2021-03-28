//
//  PokemonMapper.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import RealmSwift

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
        type: result.type.map { type in
          return type
        },
        favoriteState: false
      )
    }
  }

  static func mapPokemonResponsesToEntities(input pokemonResponses: [PokemonResponse]) -> [PokemonEntity] {
    return pokemonResponses.map { result in
      let newPokemon = PokemonEntity()
      newPokemon.id = result.id ?? 0
      newPokemon.name = result.name ?? "Unknow"
      newPokemon.num = result.num ?? "000"
      newPokemon.desc = result.description ?? "Unknow"
      newPokemon.img = result.img ?? "Unknow"
      newPokemon.height = result.height ?? "Unknow"
      newPokemon.weight = result.weight ?? "Unknow"
      newPokemon.attack = result.attack ?? 0
      newPokemon.defense = result.defense ?? 0
      newPokemon.favoriteState = false

      for type in result.type {
        newPokemon.type.append(type)
      }

      return newPokemon
    }
  }

  static func mapPokemonEntitiesToDomains(input pokemonEntities: [PokemonEntity]) -> [PokemonModel] {
    return pokemonEntities.map { result in
      return PokemonModel(
        id: result.id,
        name: result.name,
        num: result.num,
        description: result.desc,
        img: result.img,
        height: result.height,
        weight: result.weight,
        attack: result.attack,
        defense: result.defense,
        type: result.type.map { type in
          return type
        },
        favoriteState: result.favoriteState
      )
    }
  }

}
