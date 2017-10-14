//
//  PokemonStatistics.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 09/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct PokemonStatistics {
  
  // MARK: - PROPERTIES
  
  private enum Keys: String {
    case speed, defense, attack
    case healthPoints = "hp"
    case specialDefense = "special-defense"
    case specialAttack = "special-attack"
  }
  
  let speed: Int
  let specialDefense: Int
  let specialAttack: Int
  let defense: Int
  let attack: Int
  let healthPoints: Int

  // MARK: - INITIALIZER

  init(stats: [PokemonRawStatistic]) {
    speed = stats.filter { $0.name == Keys.speed.rawValue }.first?.value ?? 0
    specialDefense = stats.filter { $0.name == Keys.specialDefense.rawValue }.first?.value ?? 0
    specialAttack  = stats.filter { $0.name == Keys.specialAttack.rawValue }.first?.value ?? 0
    defense = stats.filter { $0.name == Keys.defense.rawValue }.first?.value ?? 0
    attack = stats.filter { $0.name == Keys.attack.rawValue }.first?.value ?? 0
    healthPoints = stats.filter { $0.name == Keys.healthPoints.rawValue }.first?.value ?? 0
  }
  
}

struct PokemonRawStatistic: Decodable {
  // MARK: - PROPERTIES
  let name: String
  let value: Int

  // MARK: - KEYS
  enum CodingKeys: String, CodingKey {
    case stat
    case baseStat = "base_stat"
  }
  
  // MARK: - INITIALIZER
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let statName = try values.decode([String: String].self, forKey: .stat)
    name = statName["name"] ?? "??"
    value = try values.decode(Int.self, forKey: .baseStat)
  }
}
