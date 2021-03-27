//
//  ContentView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 27/03/21.
//

import SwiftUI

struct ContentView: View {

  @EnvironmentObject var homePresenter: HomePresenter

  var body: some View {
    NavigationView {
      HomeView(presenter: homePresenter)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
