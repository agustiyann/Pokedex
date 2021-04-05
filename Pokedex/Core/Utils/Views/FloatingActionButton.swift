//
//  FloatingActionButton.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI

struct ActionButton: View {
  var icon: String
  var height: CGFloat = 24
  var width: CGFloat = 24
  var backgroundColor: Color = .purple

  var action: () -> Void

  var body: some View {
    Button(action: { action() }, label: {
      Image(systemName: icon)
        .resizable()
        .frame(width: width, height: height)
        .padding(25)
    })
    .background(backgroundColor)
    .foregroundColor(.white)
    .clipShape(Circle())
    .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
  }
}
