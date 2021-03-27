//
//  HomeRouter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

class HomeRouter {

  func makeInfoView(for id: Int) -> some View {
    let infoUseCase = Injection.init().provideInfo()
    let presenter = InfoPresenter(infoUseCase: infoUseCase)
    return InfoView(presenter: presenter, id: id)
  }

}
