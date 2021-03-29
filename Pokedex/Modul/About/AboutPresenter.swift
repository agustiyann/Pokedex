//
//  AboutPresenter.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 29/03/21.
//

import SwiftUI

class AboutPresenter: ObservableObject {

  @Published var name = ""
  @Published var about = ""
  @Published var image = Data.init()

  @AppStorage("name") var nameProfile = "Agus Tiyansyah Syam"
  @AppStorage("about") var aboutProfile = "IT Student - Aspiring iOS Developer"
  @AppStorage("image") var imageProfile = UIImage(imageLiteralResourceName: "me").jpegData(compressionQuality: 1)!

  func getProfile() {
    self.name = nameProfile
    self.about = aboutProfile
    self.image = imageProfile
  }

  func setProfile() {
    UserDefaults.standard.setValue(self.name, forKey: "name")
    UserDefaults.standard.setValue(self.about, forKey: "about")
    UserDefaults.standard.setValue(self.image, forKey: "image")
  }

}
