//
//  Injection.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import Foundation

final class Injection: NSObject {

  private func provideRepository() -> PokemonRepositoryProtocol {
    let remote: RemoteDataSource = RemoteDataSource.sharedInstance
    return PokemonRepository.sharedInstance(remote)
  }

  func provideHome() -> HomeUseCase {
    let repository = provideRepository()
    return HomeInteractor(repository: repository)
  }

  func provideInfo() -> InfoUseCase {
    let repository = provideRepository()
    return InfoInteractor(repository: repository)
  }

}
