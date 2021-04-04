//
//  LocalDataSource.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import Foundation
import RealmSwift
import Combine

protocol LocalDataSourceProtocol: class {

  func addPokemons(from pokemons: [PokemonEntity]) -> AnyPublisher<Bool, Error>
  func getPokemons() -> AnyPublisher<[PokemonEntity], Error>
  func getPokemon(by id: String) -> AnyPublisher<PokemonEntity, Error>
  func getFavoritePokemonList() -> AnyPublisher<[PokemonEntity], Error>
  func updateFavoritePokemon(by id: String) -> AnyPublisher<PokemonEntity, Error>
  func getPokemonsBy(_ name: String) -> AnyPublisher<[PokemonEntity], Error>

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

  func addPokemons(from pokemons: [PokemonEntity]) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            for pokemon in pokemons {
              realm.add(pokemon, update: .all)
            }
            completion(.success(true))
          }
        } catch {
          completion(.failure(DatabaseError.requestFailed))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }

  func getPokemons() -> AnyPublisher<[PokemonEntity], Error> {
    return Future<[PokemonEntity], Error> { completion in
      if let realm = self.realm {
        let pokemons: Results<PokemonEntity> = {
          realm.objects(PokemonEntity.self)
            .sorted(byKeyPath: "id", ascending: true)
        }()
        completion(.success(pokemons.toArray(ofType: PokemonEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }

  func getPokemon(by id: String) -> AnyPublisher<PokemonEntity, Error> {
    return Future<PokemonEntity, Error> { completion in
      if let realm = self.realm {
        let pokemons: Results<PokemonEntity> = {
          realm.objects(PokemonEntity.self)
            .filter("id = '\(id)'")
        }()

        guard let pokemon = pokemons.first else {
          completion(.failure(DatabaseError.requestFailed))
          return
        }
        completion(.success(pokemon))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }

  func getFavoritePokemonList() -> AnyPublisher<[PokemonEntity], Error> {
    return Future<[PokemonEntity], Error> { completion in
      if let realm = self.realm {
        let pokemonEntities = {
          realm.objects(PokemonEntity.self)
            .filter("favoriteState = \(true)")
            .sorted(byKeyPath: "id", ascending: true)
        }()
        completion(.success(pokemonEntities.toArray(ofType: PokemonEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }
    .eraseToAnyPublisher()
  }

  func updateFavoritePokemon(by id: String) -> AnyPublisher<PokemonEntity, Error> {
    return Future<PokemonEntity, Error> { completion in
      if let realm = self.realm, let pokemonEntity = {
        realm.objects(PokemonEntity.self).filter("id = '\(id)'")
      }().first {
        do {
          try realm.write {
            pokemonEntity.setValue(!pokemonEntity.favoriteState, forKey: "favoriteState")
          }
          completion(.success(pokemonEntity))
        } catch {
          completion(.failure(DatabaseError.invalidInstance))
        }
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
  }

  func getPokemonsBy(_ name: String) -> AnyPublisher<[PokemonEntity], Error> {
    return Future<[PokemonEntity], Error> { completion in
      if let realm = self.realm {
        let pokemons: Results<PokemonEntity> = {
          realm.objects(PokemonEntity.self)
            .filter("name contains[c] %@", name)
            .sorted(byKeyPath: "name", ascending: true)
        }()
        completion(.success(pokemons.toArray(ofType: PokemonEntity.self)))
      } else {
        completion(.failure(DatabaseError.invalidInstance))
      }
    }.eraseToAnyPublisher()
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
