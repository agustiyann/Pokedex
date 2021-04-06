//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 06/04/21.
//

import Foundation
import Combine
import Core

public struct GetPokemonRepository<
  PokemonLocaleDataSource: LocaleDataSource,
  Transformer: Mapper>: Repository
where
  PokemonLocaleDataSource.Request == String,
  PokemonLocaleDataSource.Response == PokemonModuleEntity,
  Transformer.Request == String,
  Transformer.Response == PokemonResponse,
  Transformer.Entity == PokemonModuleEntity,
  Transformer.Domain == PokemonDomainModel {
  
  public typealias Request = String
  public typealias Response = PokemonDomainModel

  private let _localeDataSource: PokemonLocaleDataSource
  private let _mapper: Transformer

  public init(
    localeDataSource: PokemonLocaleDataSource,
    mapper: Transformer) {

    _localeDataSource = localeDataSource
    _mapper = mapper
  }

  public func execute(request: String?) -> AnyPublisher<PokemonDomainModel, Error> {
    guard let request = request else { fatalError("Request cannot be empty") }

    return _localeDataSource.get(id: request)
      .map { _mapper.transformEntityToDomain(entity: $0) }
      .eraseToAnyPublisher()
  }
}
