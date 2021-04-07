//
//  Injection.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import RealmSwift
import UIKit
import Core
import Pokemon

final class Injection: NSObject {

  func providePokemon<U: UseCase>() -> U where U.Request == String, U.Response == [PokemonDomainModel] {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locale = GetPokemonsLocaleDataSource(realm: appDelegate.realm)
    let remote = GetPokemonsRemoteDataSource(endpoint: Endpoints.Gets.list.url)
    let pokemonMapper = PokemonTransformer()
    let mapper = PokemonsTransformer(pokemonMapper: pokemonMapper)
    let repository = GetPokemonsRepository(
      localeDataSource: locale,
      remoteDataSource: remote,
      mapper: mapper)

    return Interactor(repository: repository) as! U
  }

  func provideInfoPokemon<U: UseCase>() -> U where U.Request == String, U.Response == PokemonDomainModel {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locale = GetPokemonsLocaleDataSource(realm: appDelegate.realm)
    let mapper = PokemonTransformer()

    let repository = GetPokemonRepository(
      localeDataSource: locale,
      mapper: mapper)

    return Interactor(repository: repository) as! U
  }

  func provideUpdateFavorite<U: UseCase>() -> U where U.Request == String, U.Response == PokemonDomainModel {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locale = GetFavoritePokemonLocaleDataSource(realm: appDelegate.realm)
    let mapper = PokemonTransformer()

    let repository = UpdateFavoritePokemonRepository(
      localDataSource: locale,
      mapper: mapper)

    return Interactor(repository: repository) as! U
  }

  func provideFavorite<U: UseCase>() -> U where U.Request == String, U.Response == [PokemonDomainModel] {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locale = GetFavoritePokemonLocaleDataSource(realm: appDelegate.realm)

    let pokemonMapper = PokemonTransformer()
    let mapper = PokemonsTransformer(pokemonMapper: pokemonMapper)
    let repository = GetFavoritePokemonsRepository(
      localDataSource: locale,
      mapper: mapper)

    return Interactor(repository: repository) as! U
  }

  func provideSearch<U: UseCase>() -> U where U.Request == String, U.Response == [PokemonDomainModel] {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let locale = GetSearchPokemonLocaleDataSource(realm: appDelegate.realm)

    let pokemonMapper = PokemonTransformer()
    let mapper = PokemonsTransformer(pokemonMapper: pokemonMapper)
    let repository = SearchPokemonsRepository(
      localDataSource: locale,
      mapper: mapper)

    return Interactor(repository: repository) as! U
  }

}
