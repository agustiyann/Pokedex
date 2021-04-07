//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 07/04/21.
//

import Foundation
import Combine
import Core
import RealmSwift

public struct GetSearchPokemonLocaleDataSource: LocaleDataSource {
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
          .filter("name contains[c] %@", request ?? "")
          .sorted(byKeyPath: "name", ascending: true)
      }()
      completion(.success(pokemonEntities.toArray(ofType: PokemonModuleEntity.self)))
    }.eraseToAnyPublisher()
  }

  public func add(entities: [PokemonModuleEntity]) -> AnyPublisher<Bool, Error> {
    fatalError()
  }

  public func get(id: String) -> AnyPublisher<PokemonModuleEntity, Error> {
    return Future<PokemonModuleEntity, Error> { completion in
      let pokemons: Results<PokemonModuleEntity> = {
        _realm.objects(PokemonModuleEntity.self)
          .filter("id = '\(id)'")
      }()

      guard let pokemon = pokemons.first else {
        completion(.failure(DatabaseError.requestFailed))
        return
      }
      completion(.success(pokemon))
    }.eraseToAnyPublisher()
  }

  public func update(id: String, entity: PokemonModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }

}
