//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation

public struct CategoryDomainModel: Equatable, Identifiable {

  let id: String
  let name: String
  let description: String
  let imageurl: String
  let height: String
  let weight: String
  let hp: Int
  let attack: Int
  let defense: Int
  let specialAttack: Int
  let specialDefense: Int
  let speed: Int
  let total: Int
  let malePercentage: String
  let femalePercentage: String
  let cycles: String
  let eggGroups: String
  let type: [String]
  let weaknesses: [String]
  let favoriteState: Bool

  public init(
    id: String,
    name: String,
    description: String,
    imageurl: String,
    height: String,
    weight: String,
    hp: Int,
    attack: Int,
    defense: Int,
    specialAttack: Int,
    specialDefense: Int,
    speed: Int,
    total: Int,
    malePercentage: String,
    femalePercentage: String,
    cycles: String,
    eggGroups: String,
    type: [String],
    weaknesses: [String],
    favoriteState: Bool
  ) {
    self.id = id
    self.name = name
    self.description = description
    self.imageurl = imageurl
    self.height = height
    self.weight = weight
    self.hp = hp
    self.attack = attack
    self.defense = defense
    self.specialAttack = specialAttack
    self.specialDefense = specialDefense
    self.speed = speed
    self.total = total
    self.malePercentage = malePercentage
    self.femalePercentage = femalePercentage
    self.cycles = cycles
    self.eggGroups = eggGroups
    self.type = type
    self.weaknesses = weaknesses
    self.favoriteState = favoriteState
  }
}
