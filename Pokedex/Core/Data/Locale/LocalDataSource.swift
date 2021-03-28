//
//  LocalDataSource.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import Foundation
import RealmSwift

protocol LocalDataSourceProtocol: class {

  func getPokemonList(result: @escaping (Result<[PokemonEntity], DatabaseError>) -> Void)

  func addPokemons(from pokemons: [PokemonEntity], result: @escaping (Result<Bool, DatabaseError>) -> Void)
}

final class LocalDataSource: NSObject {

  private let realm: Realm?
  private init(realm: Realm?) {
    self.realm = realm
  }

  static let sharedInstance: (Realm?) -> LocalDataSource = { realmDB in
    return LocalDataSource(realm: realmDB)
  }
}

extension LocalDataSource: LocalDataSourceProtocol {

  func getPokemonList(result: @escaping (Result<[PokemonEntity], DatabaseError>) -> Void) {
    if let realm = realm {
      let pokemons: Results<PokemonEntity> = {
        realm.objects(PokemonEntity.self)
          .sorted(byKeyPath: "id", ascending: true)
      }()
      result(.success(pokemons.toArray(ofType: PokemonEntity.self)))
    } else {
      result(.failure(.invalidInstance))
    }
  }

  func addPokemons(from pokemons: [PokemonEntity], result: @escaping (Result<Bool, DatabaseError>) -> Void) {
    if let realm = realm {
      do {
        try realm.write {
          for pokemon in pokemons {
            realm.add(pokemon, update: .all)
          }
          result(.success(true))
        }
      } catch {
        result(.failure(.requestFailed))
      }
    } else {
      result(.failure(.invalidInstance))
    }
  }

}

extension Results {

  func toArray<T>(ofType: T.Type) -> [T] {
    var array = [T]()
    for index in 0 ..< count {
      if let result = self[index] as? T {
        array.append(result)
      }
    }
    return array
  }

}
