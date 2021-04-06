//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation
import Combine
import Core

public struct GetPokemonsRepository<
  CategoryLocaleDataSource: LocaleDataSource,
  RemoteDataSource: DataSource,
  Transformer: Mapper>: Repository
where

  CategoryLocaleDataSource.Response == PokemonModuleEntity,
  RemoteDataSource.Response == [PokemonResponse],
  Transformer.Request == String,
  Transformer.Response == [PokemonResponse],
  Transformer.Entity == [PokemonModuleEntity],
  Transformer.Domain == [PokemonDomainModel] {
  
  public typealias Request = String
  public typealias Response = [PokemonDomainModel]

  private let _localeDataSource: CategoryLocaleDataSource
  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer

  public init(
    localeDataSource: CategoryLocaleDataSource,
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {

    _localeDataSource = localeDataSource
    _remoteDataSource = remoteDataSource
    _mapper = mapper
  }

  public func execute(request: String?) -> AnyPublisher<[PokemonDomainModel], Error> {
    return _localeDataSource.list(request: nil)
      .flatMap { result -> AnyPublisher<[PokemonDomainModel], Error> in
        if result.isEmpty {
          return _remoteDataSource.execute(request: nil)
            .map { _mapper.transformResponseToEntity(request: request, response: $0) }
            .catch { _ in _localeDataSource.list(request: nil) }
            .flatMap { _localeDataSource.add(entities: $0) }
            .filter { $0 }
            .flatMap { _ in _localeDataSource.list(request: nil)
              .map { _mapper.transformEntityToDomain(entity: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
}
