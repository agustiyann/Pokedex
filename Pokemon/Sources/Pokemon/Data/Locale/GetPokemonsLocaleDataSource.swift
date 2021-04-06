//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation
import Combine
import Core
import RealmSwift
import Foundation

public struct GetPokemonsLocaleDataSource: LocaleDataSource {

  public typealias Request = Any
  public typealias Response = PokemonModuleEntity

  private let _realm: Realm

  public init(realm: Realm) {
    _realm = realm
  }

  public func list(request: Any?) -> AnyPublisher<[PokemonModuleEntity], Error> {
    return Future<[PokemonModuleEntity], Error> { completion in
      let pokemons: Results<PokemonModuleEntity> = {
        _realm.objects(PokemonModuleEntity.self)
          .sorted(byKeyPath: "id", ascending: true)
      }()
      completion(.success(pokemons.toArray(ofType: PokemonModuleEntity.self)))
    }.eraseToAnyPublisher()
  }

  public func add(entities: [PokemonModuleEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      do {
        try _realm.write {
          for pokemon in entities {
            _realm.add(pokemon, update: .all)
          }
          completion(.success(true))
        }
      } catch {
        completion(.failure(DatabaseError.requestFailed))
      }
    }.eraseToAnyPublisher()
  }

  public func get(id: String) -> AnyPublisher<PokemonModuleEntity, Error> {
    fatalError()
  }

  public func update(id: String, entity: PokemonModuleEntity) -> AnyPublisher<Bool, Error> {
    fatalError()
  }
}
