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
        id: result.id ?? "#000",
        name: result.name ?? "Unknow",
        description: result.description ?? "Unknow",
        imageurl: result.imageurl ?? "Unknow",
        height: result.height ?? "Unknow",
        weight: result.weight ?? "Unknow",
        hp: result.hp ?? 0,
        attack: result.attack ?? 0,
        defense: result.defense ?? 0,
        specialAttack: result.specialAttack ?? 0,
        specialDefense: result.specialDefense ?? 0,
        speed: result.speed ?? 0,
        total: result.total ?? 0,
        malePercentage: result.malePercentage ?? "Unknow",
        femalePercentage: result.femalePercentage ?? "Unknow",
        cycles: result.cycles ?? "Unknow",
        eggGroups: result.eggGroups ?? "Unknow",

        type: result.type.map { type in
          return type
        },
        weaknesses: result.weaknesses.map { weaknes in
          return weaknes
        },

        favoriteState: false
      )
    }
  }

  static func mapPokemonResponsesToEntities(input pokemonResponses: [PokemonResponse]) -> [PokemonEntity] {
    return pokemonResponses.map { result in
      let newPokemon = PokemonEntity()
      newPokemon.id = result.id ?? "#000"
      newPokemon.name = result.name ?? "Unknow"
      newPokemon.desc = result.description ?? "Unknow"
      newPokemon.image = result.imageurl ?? "Unknow"
      newPokemon.height = result.height ?? "Unknow"
      newPokemon.weight = result.weight ?? "Unknow"
      newPokemon.hp = result.hp ?? 0
      newPokemon.attack = result.attack ?? 0
      newPokemon.defense = result.defense ?? 0
      newPokemon.specialAttack = result.specialAttack ?? 0
      newPokemon.specialDefense = result.specialDefense ?? 0
      newPokemon.speed = result.speed ?? 0
      newPokemon.total = result.total ?? 0
      newPokemon.malePercentage = result.malePercentage ?? "Unknow"
      newPokemon.femalePercentage = result.femalePercentage ?? "Unknow"
      newPokemon.cycles = result.cycles ?? "Unknow"
      newPokemon.eggGroups = result.eggGroups ?? "Unknow"
      newPokemon.favoriteState = false

      for type in result.type {
        newPokemon.type.append(type)
      }

      for weaknes in result.weaknesses {
        newPokemon.weaknesses.append(weaknes)
      }

      return newPokemon
    }
  }

  static func mapPokemonEntitiesToDomains(input pokemonEntities: [PokemonEntity]) -> [PokemonModel] {
    return pokemonEntities.map { result in
      return PokemonModel(
        id: result.id,
        name: result.name,
        description: result.desc,
        imageurl: result.image,
        height: result.height,
        weight: result.weight,
        hp: result.hp,
        attack: result.attack,
        defense: result.defense,
        specialAttack: result.specialAttack,
        specialDefense: result.specialDefense,
        speed: result.speed,
        total: result.total,
        malePercentage: result.malePercentage,
        femalePercentage: result.femalePercentage,
        cycles: result.cycles,
        eggGroups: result.eggGroups,

        type: result.type.map { type in
          return type
        },
        weaknesses: result.weaknesses.map { weaknes in
          return weaknes
        },
        favoriteState: result.favoriteState
      )
    }
  }

  static func mapPokemonDomainToEntity(input result: PokemonModel) -> PokemonEntity {
    let newPokemon = PokemonEntity()
    newPokemon.id = result.id
    newPokemon.name = result.name
    newPokemon.desc = result.description
    newPokemon.image = result.imageurl
    newPokemon.height = result.height
    newPokemon.weight = result.weight
    newPokemon.hp = result.hp
    newPokemon.attack = result.attack
    newPokemon.defense = result.defense
    newPokemon.specialAttack = result.specialAttack
    newPokemon.specialDefense = result.specialDefense
    newPokemon.speed = result.speed
    newPokemon.total = result.total
    newPokemon.malePercentage = result.malePercentage
    newPokemon.femalePercentage = result.femalePercentage
    newPokemon.cycles = result.cycles
    newPokemon.eggGroups = result.eggGroups
    newPokemon.favoriteState = false

    for type in result.type {
      newPokemon.type.append(type)
    }

    for weaknes in result.weaknesses {
      newPokemon.weaknesses.append(weaknes)
    }

    return newPokemon
  }

  static func mapPokemonEntityToDomain(input result: PokemonEntity) -> PokemonModel {
    return PokemonModel(
      id: result.id,
      name: result.name,
      description: result.desc,
      imageurl: result.image,
      height: result.height,
      weight: result.weight,
      hp: result.hp,
      attack: result.attack,
      defense: result.defense,
      specialAttack: result.specialAttack,
      specialDefense: result.specialDefense,
      speed: result.speed,
      total: result.total,
      malePercentage: result.malePercentage,
      femalePercentage: result.femalePercentage,
      cycles: result.cycles,
      eggGroups: result.eggGroups,

      type: result.type.map { type in
        return type
      },
      weaknesses: result.weaknesses.map { weaknes in
        return weaknes
      },
      favoriteState: result.favoriteState
    )
  }

}
