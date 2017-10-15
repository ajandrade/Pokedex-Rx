//
//  Pokemon.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 22/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct Pokemon {
  
  // MARK: - PROPERTIES
  
  let identifier: Int
  let name: String
  let height: Int
  let weight: Int
  let type: PokemonTypes
  let stats: PokemonStatistics
  let evolution: PokemonEvolution?
  
  // MARK: - METHODS
  
  func updateEvolution(_ evolution: PokemonEvolution) -> Pokemon {
    return Pokemon(identifier: identifier, name: name, height: height, weight: weight, type: type, stats: stats, evolution: evolution)
  }
  
}

extension Pokemon: Decodable {
  
  // MARK: - KEYS

  enum CodingKeys: String, CodingKey { case identifier = "id", name, weight, height, types, stats }
  
  // MARK: - INITIALIZER

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    identifier = try values.decode(Int.self, forKey: .identifier)
    name = try values.decode(String.self, forKey: .name)
    weight = try values.decode(Int.self, forKey: .weight)
    height = try values.decode(Int.self, forKey: .height)
    let types = try values.decode([PokemonRawType].self, forKey: .types)
    type = PokemonTypes(types: types)
    let statistics = try values.decode([PokemonRawStatistic].self, forKey: .stats)
    stats = PokemonStatistics(stats: statistics)
    evolution = nil
  }

}
