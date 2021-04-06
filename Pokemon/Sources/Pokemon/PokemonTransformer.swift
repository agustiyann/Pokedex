//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation
import Core

public struct PokemonTransformer: Mapper {
  public typealias Response = [PokemonResponse]
  public typealias Entity = [PokemonModuleEntity]
  public typealias Domain = [PokemonDomainModel]

  public init() {}

  public func transformResponseToEntity(response: [PokemonResponse]) -> [PokemonModuleEntity] {
    return response.map { result in
      let newPokemon = PokemonModuleEntity()
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

  public func transformEntityToDomain(entity: [PokemonModuleEntity]) -> [PokemonDomainModel] {
    return entity.map { result in
      return PokemonDomainModel(
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
}
