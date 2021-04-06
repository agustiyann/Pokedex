//
//  File.swift
//  
//
//  Created by Agus Tiyansyah Syam on 05/04/21.
//

import Foundation

public struct PokemonDomainModel: Equatable, Identifiable {

  public let id: String
  public let name: String
  public let description: String
  public let imageurl: String
  public let height: String
  public let weight: String
  public let hp: Int
  public let attack: Int
  public let defense: Int
  public let specialAttack: Int
  public let specialDefense: Int
  public let speed: Int
  public let total: Int
  public let malePercentage: String
  public let femalePercentage: String
  public let cycles: String
  public let eggGroups: String
  public let type: [String]
  public let weaknesses: [String]
  public let favoriteState: Bool

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
