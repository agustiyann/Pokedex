//
//  PokemonEntity.swift
//  Pokedex
//
//  Created by Agus Tiyansyah Syam on 28/03/21.
//

import Foundation
import RealmSwift

class PokemonEntity: Object {

  @objc dynamic var id: String = ""
  @objc dynamic var name: String = ""
  @objc dynamic var desc: String = ""
  @objc dynamic var image: String = ""
  @objc dynamic var height: String = ""
  @objc dynamic var weight: String = ""
  @objc dynamic var hp: Int = 0
  @objc dynamic var attack: Int = 0
  @objc dynamic var defense: Int = 0
  @objc dynamic var specialAttack: Int = 0
  @objc dynamic var specialDefense: Int = 0
  @objc dynamic var speed: Int = 0
  @objc dynamic var total: Int = 0
  @objc dynamic var malePercentage: String = ""
  @objc dynamic var femalePercentage: String = ""
  @objc dynamic var cycles: String = ""
  @objc dynamic var eggGroups: String = ""
  let type = List<String>()
  let weaknesses = List<String>()
  @objc dynamic var favoriteState: Bool = false

  override class func primaryKey() -> String? {
    return "id"
  }

}
