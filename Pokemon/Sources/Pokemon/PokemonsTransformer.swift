//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 06/04/21.
//

import Foundation
import Core

public struct PokemonsTransformer<PokemonMapper: Mapper>: Mapper
where
  PokemonMapper.Request == String,
  PokemonMapper.Response == PokemonResponse,
  PokemonMapper.Entity == PokemonModuleEntity,
  PokemonMapper.Domain == PokemonDomainModel
{
  public typealias Request = String
  public typealias Response = [PokemonResponse]
  public typealias Entity = [PokemonModuleEntity]
  public typealias Domain = [PokemonDomainModel]

  private let _pokemonMapper: PokemonMapper

  public init(pokemonMapper: PokemonMapper) {
    _pokemonMapper = pokemonMapper
  }

  public func transformResponseToEntity(request: String?, response: [PokemonResponse]) -> [PokemonModuleEntity] {
    return response.map { result in
      _pokemonMapper.transformResponseToEntity(request: request, response: result)
    }
  }

  public func transformEntityToDomain(entity: [PokemonModuleEntity]) -> [PokemonDomainModel] {
    return entity.map { result in
      return _pokemonMapper.transformEntityToDomain(entity: result)
    }
  }

}
