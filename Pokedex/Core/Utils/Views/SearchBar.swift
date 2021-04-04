//
//  SearchBar.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 04/04/21.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {

  let placeHolder: String
  @Binding var text: String

  func updateUIView(_ uiView: UISearchBar, context: Context) {
    uiView.text = text
  }

  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.placeholder = placeHolder
    searchBar.searchBarStyle = .minimal
    searchBar.enablesReturnKeyAutomatically = false
    searchBar.delegate = context.coordinator
    return searchBar
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(text: self.$text)
  }

  class Coordinator: NSObject, UISearchBarDelegate {
    @Binding var text: String
    init(text: Binding<String>) {
      _text = text
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      self.text = searchText
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
    }
  }

}
