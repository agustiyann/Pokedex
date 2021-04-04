//
//  CustomEmptyView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI

struct CustomEmptyView: View {
  var image: String
  var title: String

  var body: some View {
    VStack {
      Image(image)
        .resizable()
        .renderingMode(.original)
        .scaledToFit()
        .frame(width: 200)

      Text(title)
        .font(.system(.body, design: .rounded))
    }
  }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView(image: "me", title: "No")
    }
}
