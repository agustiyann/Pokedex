//
//  FavoriteRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

class FavoriteRouter {
  func makeInfoView(for pokemon: PokemonModel) -> some View {
    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter)
  }
}
