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
  func getArticle(by num: String) -> AnyPublisher<PokemonEntity, Error>
  func addPokemonFavorite(from pokemon: PokemonEntity) -> AnyPublisher<Bool, Error>
  func removePokemonFavorite(from pokemon: PokemonEntity) -> AnyPublisher<Bool, Error>
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

  func getArticle(by num: String) -> AnyPublisher<PokemonEntity, Error> {
    return Future<PokemonEntity, Error> { completion in
      if let realm = self.realm {
        let pokemons: Results<PokemonEntity> = {
          realm.objects(PokemonEntity.self)
            .filter("num = '\(num)'")
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

  func addPokemonFavorite(from pokemon: PokemonEntity) -> AnyPublisher<Bool, Error> {
    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            if realm.isInWriteTransaction {
              if realm.object(ofType: PokemonEntity.self, forPrimaryKey: pokemon.id) != nil {
                completion(.failure(DatabaseError.requestFailed))
              } else {
                pokemon.favoriteState = true
                realm.add(pokemon, update: .all)
                completion(.success(true))
              }
            } else {
              completion(.failure(DatabaseError.requestFailed))
            }
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

  func removePokemonFavorite(from pokemon: PokemonEntity) -> AnyPublisher<Bool, Error> {

    return Future<Bool, Error> { completion in
      if let realm = self.realm {
        do {
          try realm.write {
            let objectToDelete = realm.objects(PokemonEntity.self)
              .filter("id = \(pokemon.id)")
            realm.delete(objectToDelete)
            completion(.success(false))
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
