//
//  AboutView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct AboutView: View {

  @AppStorage("name") var name = "Agus Tiyansyah Syam"
  @AppStorage("about") var about = "IT Student - Aspiring iOS Developer"
  @AppStorage("image") var image = UIImage(imageLiteralResourceName: "me").jpegData(compressionQuality: 1)!

  @State var linkEdit = false

  var body: some View {
    VStack(alignment: .center) {
      profileImage
      Text(name)
        .font(.title3)
        .fontWeight(.bold)
        .padding(.top)
      Text(about)
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
    .background(
      NavigationLink(
        destination: EditAboutView(), isActive: $linkEdit) {}
    )
  }
}

extension AboutView {

  var profileImage: some View {
    Image(uiImage: UIImage(data: self.image) ?? UIImage(imageLiteralResourceName: "me"))
      .resizable()
      .scaledToFill()
      .frame(width: 150, height: 150, alignment: .center)
      .cornerRadius(100)
      .padding(.top)
      .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
  }

}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AboutView()
    }
  }
}
