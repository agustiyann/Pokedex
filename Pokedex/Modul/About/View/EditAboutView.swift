//
//  EditAboutView.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

struct EditAboutView: View {

  @ObservedObject var presenter: AboutPresenter

  @Environment(\.presentationMode) var presentationMode

  @State var name: String = ""
  @State var about: String = ""
  @State var emptyField = false
  @State var image: Image?
  @State var showingImagePicker = false
  @State var inputImage: UIImage?

  func loadImage() {
      guard let inputImage = inputImage else { return }
      image = Image(uiImage: inputImage)
  }

  var body: some View {
    VStack(alignment: .center) {
      if image != nil {
        image?
          .resizable()
          .scaledToFill()
          .frame(width: 150, height: 150, alignment: .center)
          .cornerRadius(100)
          .padding(.top)
          .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
          .overlay(
            Image(systemName: "square.and.pencil")
              .resizable()
              .foregroundColor(.white)
              .scaledToFill()
              .frame(width: 40, height: 40)
              .opacity(0.5)
          )
          .onTapGesture {
            self.showingImagePicker = true
          }
      } else {
        profileImage
          .overlay(
            Image(systemName: "square.and.pencil")
              .resizable()
              .foregroundColor(.white)
              .scaledToFill()
              .frame(width: 40, height: 40)
              .opacity(0.5)
          )
          .onTapGesture {
            self.showingImagePicker = true
          }
      }

      Text("Name")
        .bold()
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)

      Text("About")
        .bold()
      TextField("About...", text: $about)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal)

      Button(action: {
        if !name.isEmpty && !about.isEmpty {
          print("Save profile")
          self.presenter.name = name
          self.presenter.about = about
          if inputImage != nil {
            self.presenter.image = (inputImage?.jpegData(compressionQuality: 1.0)!)!
          }

          self.presenter.setProfile()
          self.presentationMode.wrappedValue.dismiss()
        } else {
          emptyField = true
        }
      }, label: {
        Text("Save")
      })
      .padding()
      .buttonStyle(FilledButton())
      .alert(isPresented: $emptyField, content: {
        Alert(title: Text("Warning"), message: Text("Please fill in all fields!"), dismissButton: .default(Text("OK")))
      })

      Spacer()
    }
    .onAppear {
      self.presenter.getProfile()
      name = self.presenter.name
      about = self.presenter.about
    }
    .padding(.top, -40)
    .sheet(isPresented: $showingImagePicker, onDismiss: loadImage, content: {
      ImagePicker(image: self.$inputImage)
    })
  }
}

extension EditAboutView {

  var profileImage: some View {
    Image(uiImage: UIImage(data: self.presenter.image) ?? UIImage(imageLiteralResourceName: "me"))
      .resizable()
      .scaledToFill()
      .frame(width: 150, height: 150, alignment: .center)
      .cornerRadius(100)
      .padding(.top)
      .shadow(color: .black, radius: 5, x: 0.0, y: 0.0)
  }

}
