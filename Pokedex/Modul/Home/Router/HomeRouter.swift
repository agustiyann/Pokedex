//
//  HomeRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI
import Core
import Pokemon

class HomeRouter {

  func makeInfoView(for pokemon: PokemonDomainModel) -> some View {
    let useCase: Interactor<Any,
                            [PokemonDomainModel],
                            GetPokemonsRepository<GetPokemonsLocaleDataSource, GetPokemonsRemoteDataSource, PokemonTransformer>> = Injection.init().providePokemon()
    let presenter = GetListPresenter(useCase: useCase)
//    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
//    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter, pokemon: pokemon)
  }

}
