//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import Foundation
import RealmSwift

class PokemonEntity: Object {

  @objc dynamic var id: Int = 0
  @objc dynamic var name: String = ""
  @objc dynamic var num: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var img: String = ""
  @objc dynamic var height: String = ""
  @objc dynamic var weight: String = ""
  @objc dynamic var attack: Int = 0
  @objc dynamic var defense: Int = 0
  let type = List<String>()
  @objc dynamic var favoriteState: Bool = false

  override class func primaryKey() -> String? {
    return "id"
  }

}
