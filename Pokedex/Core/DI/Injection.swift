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

  private func provideRepository() -> PokemonRepositoryProtocol {
    let realm = try? Realm()
    let locale: LocalDataSource = LocalDataSource.sharedInstance(realm)
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return PokemonRepository.sharedInstance(locale, remote)
  }

  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideInfo(pokemon: PokemonModel) -> InfoUseCase {
    let repository = provideRepository()
    return InfoInteractor(repository: repository, pokemon: pokemon)
  }

//  func provideFavorite() -> FavoriteUseCase {
//    let repository = provideRepository()
//    return FavoriteInteractor(repository: repository)
//  }

  func provideSearch() -> SearchUseCase {
    let repository = provideRepository()
    return SearchInteractor(repository: repository)
  }

}
