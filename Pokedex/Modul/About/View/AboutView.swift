//
//  AboutView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
      NavigationView {
        Text("About")
          .navigationBarTitle(Text("About"), displayMode: .inline)
      }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
