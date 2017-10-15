//
//  PokemonTypes.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 09/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct PokemonTypes {
  // MARK: - PROPERTIES
  let name: String
  
  // MARK: - INITIALIZER
  init(types: [PokemonRawType]) {
    var allTypes = ""
    types.forEach { pokemonType in allTypes.append("\(pokemonType.name) ") }
    name = allTypes
  }
}

struct PokemonRawType: Decodable {
  // MARK: - PROPERTIES
  let name: String
  
  // MARK: - KEYS
  enum CodingKeys: String, CodingKey { case type }
  
  // MARK: - INITIALIZER
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let type = try values.decode([String: String].self, forKey: .type)
    name = type["name"] ?? ""
  }
}
