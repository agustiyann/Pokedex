//
//  AboutView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct AboutView: View {

  @ObservedObject var presenter: AboutPresenter

  @State var linkEdit = false

  var body: some View {
    VStack(alignment: .center) {
      profileImage
      Text(presenter.name)
        .font(.title3)
        .fontWeight(.bold)
        .padding(.top)
      Text(presenter.about)
        .frame(minWidth: 0, maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .padding(.horizontal)

      Button(action: { linkEdit = true }, label: {
        Text("Edit")
      })
      .padding()
      .buttonStyle(FilledButton())

      Spacer()
    }
    .onAppear {
      self.presenter.getProfile()
    }
    .background(
      NavigationLink(
        destination: EditAboutView(presenter: presenter), isActive: $linkEdit) {}
    )
  }
}

extension AboutView {

  var profileImage: some View {
    Image(uiImage: UIImage(data: presenter.image) ?? UIImage(imageLiteralResourceName: "me"))
      .resizable()
      .scaledToFill()
      .frame(width: 150, height: 150, alignment: .center)
      .cornerRadius(100)
      .padding(.top)
      .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
  }

}
