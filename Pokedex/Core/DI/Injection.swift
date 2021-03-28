//
//  Injection.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {

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

}
