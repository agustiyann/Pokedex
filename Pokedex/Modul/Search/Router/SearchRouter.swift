//
//  SearchRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI
import Core
import Pokemon

class SearchRouter {
  func makeInfoView(for pokemon: PokemonDomainModel) -> some View {
//    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
//    let presenter = InfoPresenter(infoUseCase: infoUseCase)
//    return InfoView(presenter: presenter)
    let useCase: Interactor<Any,
                            [PokemonDomainModel],
                            GetPokemonsRepository<GetPokemonsLocaleDataSource, GetPokemonsRemoteDataSource, PokemonTransformer>> = Injection.init().providePokemon()
    let presenter = GetListPresenter(useCase: useCase)
//    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
//    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter, pokemon: pokemon)
  }
}
