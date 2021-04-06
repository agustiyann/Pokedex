//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 06/04/21.
//

import Foundation
import Core
import Combine

public struct GetFavoritePokemonsRepository<
  PokemonLocaleDatSource: LocaleDataSource,
  Transformer: Mapper>: Repository
where
  PokemonLocaleDatSource.Request == String,
  PokemonLocaleDatSource.Response == PokemonModuleEntity,
  Transformer.Request == String,
  Transformer.Response == [PokemonResponse],
  Transformer.Entity == [PokemonModuleEntity],
  Transformer.Domain == [PokemonDomainModel]
{
  public typealias Request = String
  public typealias Response = [PokemonDomainModel]

  private let _localDataSource: PokemonLocaleDatSource
  private let _mapper: Transformer

  public init(
    localDataSource: PokemonLocaleDatSource,
    mapper: Transformer
  ) {
    _localDataSource = localDataSource
    _mapper = mapper
  }

  public func execute(request: String?) -> AnyPublisher<[PokemonDomainModel], Error> {
    return _localDataSource.list(request: request ?? "")
      .map { _mapper.transformEntityToDomain(entity: $0) }
      .eraseToAnyPublisher()
  }

}
