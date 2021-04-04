//
//  SearchRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI

class SearchRouter {
  func makeInfoView(for pokemon: PokemonModel) -> some View {
    let infoUseCase = Injection.init().provideInfo(pokemon: pokemon)
    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter)
  }
}
