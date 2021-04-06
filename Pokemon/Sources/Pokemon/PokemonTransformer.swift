//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation
import Core

public struct PokemonTransformer: Mapper {
  public typealias Request = String
  public typealias Response = PokemonResponse
  public typealias Entity = PokemonModuleEntity
  public typealias Domain = PokemonDomainModel

  public init() {}

  public func transformResponseToEntity(request: String?, response: PokemonResponse) -> PokemonModuleEntity {
      let newPokemon = PokemonModuleEntity()
      newPokemon.id = response.id ?? "#000"
      newPokemon.name = response.name ?? "Unknow"
      newPokemon.desc = response.description ?? "Unknow"
      newPokemon.image = response.imageurl ?? "Unknow"
      newPokemon.height = response.height ?? "Unknow"
      newPokemon.weight = response.weight ?? "Unknow"
      newPokemon.hp = response.hp ?? 0
      newPokemon.attack = response.attack ?? 0
      newPokemon.defense = response.defense ?? 0
      newPokemon.specialAttack = response.specialAttack ?? 0
      newPokemon.specialDefense = response.specialDefense ?? 0
      newPokemon.speed = response.speed ?? 0
      newPokemon.total = response.total ?? 0
      newPokemon.malePercentage = response.malePercentage ?? "Unknow"
      newPokemon.femalePercentage = response.femalePercentage ?? "Unknow"
      newPokemon.cycles = response.cycles ?? "Unknow"
      newPokemon.eggGroups = response.eggGroups ?? "Unknow"
      newPokemon.favoriteState = false

      for type in response.type {
        newPokemon.type.append(type)
      }

      for weaknes in response.weaknesses {
        newPokemon.weaknesses.append(weaknes)
      }

      return newPokemon
  }

  public func transformEntityToDomain(entity: PokemonModuleEntity) -> PokemonDomainModel {
    return PokemonDomainModel(
      id: entity.id,
      name: entity.name,
      description: entity.desc,
      imageurl: entity.image,
      height: entity.height,
      weight: entity.weight,
      hp: entity.hp,
      attack: entity.attack,
      defense: entity.defense,
      specialAttack: entity.specialAttack,
      specialDefense: entity.specialDefense,
      speed: entity.speed,
      total: entity.total,
      malePercentage: entity.malePercentage,
      femalePercentage: entity.femalePercentage,
      cycles: entity.cycles,
      eggGroups: entity.eggGroups,

      type: entity.type.map { type in
        return type
      },
      weaknesses: entity.weaknesses.map { weaknes in
        return weaknes
      },
      favoriteState: entity.favoriteState
    )
  }
}
