//
//  FavoriteRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI
import Core
import Pokemon

class FavoriteRouter {
  func makeInfoView(for pokemon: PokemonDomainModel) -> some View {
    let useCase: Interactor<String,
                            [PokemonDomainModel],
                            GetPokemonsRepository<GetPokemonsLocaleDataSource, GetPokemonsRemoteDataSource, PokemonsTransformer<PokemonTransformer>>> = Injection.init().providePokemon()
    let presenter = GetListPresenter(useCase: useCase)
//    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
//    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter, pokemon: pokemon)
  }
}
