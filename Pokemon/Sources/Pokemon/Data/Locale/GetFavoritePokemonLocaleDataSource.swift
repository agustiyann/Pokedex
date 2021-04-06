//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 06/04/21.
//

import Foundation
import Combine
import Core
import RealmSwift

public struct GetFavoritePokemonLocaleDataSource: LocaleDataSource {
  public typealias Request = String
  public typealias Response = PokemonModuleEntity

  private let _realm: Realm

  public init(realm: Realm) {
    _realm = realm
  }

  public func list(request: String?) -> AnyPublisher<[PokemonModuleEntity], Error> {
    return Future<[PokemonModuleEntity], Error> { completion in
      let pokemonEntities = {
        _realm.objects(PokemonModuleEntity.self)
          .filter("favoriteState = \(true)")
          .sorted(byKeyPath: "id", ascending: true)
      }()
      completion(.success(pokemonEntities.toArray(ofType: PokemonModuleEntity.self)))
    }.eraseToAnyPublisher()
  }

  public func add(entities: [PokemonModuleEntity]) -> AnyPublisher<Bool, Error> {
    fatalError()
  }

  public func get(id: String) -> AnyPublisher<PokemonModuleEntity, Error> {
    return Future<PokemonModuleEntity, Error> { completion in
      if let pokemonEntity = {
        _realm.objects(PokemonModuleEntity.self).filter("id = '\(id)'")
      }().first {
        do {
          try _realm.write {
            pokemonEntity.setValue(!pokemonEntity.favoriteState, forKey: "favoriteState")
          }
          completion(.success(pokemonEntity))
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }

  public func update(id: String, entity: PokemonModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }

}
