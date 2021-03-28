//
//  CustomButtonStyle.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import SwiftUI

struct FilledButton: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .frame(maxWidth: .infinity)
      .foregroundColor(configuration.isPressed ? .gray : .white)
      .padding(10)
      .background(Color.pink)
      .cornerRadius(8)
  }
}
