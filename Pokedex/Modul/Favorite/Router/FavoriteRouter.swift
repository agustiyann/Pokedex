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
                            PokemonDomainModel,
                            GetPokemonRepository<GetPokemonsLocaleDataSource, PokemonTransformer>> = Injection.init().provideInfoPokemon()
    let favoriteUseCase: Interactor<String,
                                    PokemonDomainModel,
                                    UpdateFavoritePokemonRepository<GetFavoritePokemonLocaleDataSource, PokemonTransformer>> = Injection.init().provideUpdateFavorite()
    let presenter = PokemonPresenter(pokemonUseCase: useCase, favoriteUseCase: favoriteUseCase)
//    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
//    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter, pokemon: pokemon)
  }
}
