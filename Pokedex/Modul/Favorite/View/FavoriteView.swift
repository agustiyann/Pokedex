//
//  FavoriteView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
      NavigationView {
        Text("Favorite")
          .navigationBarTitle(Text("Favorite"), displayMode: .inline)
      }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
