//
//  PokemonEvolution.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 08/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct PokemonEvolution {
  
  // MARK: - PROPERTIES

  let identifier: Int
  let name: String
  
}

extension PokemonEvolution: Decodable {

  // MARK: - KEYS

  enum CodingKeys: String, CodingKey {
    case identifier = "national_id"
    case evolutions
  }

  // MARK: - INITIALIZER

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let id = try values.decode(Int.self, forKey: .identifier)
    let evolutions = try? values.decode([PokemonRawEvolution].self, forKey: .evolutions)
    name = evolutions?.filter { $0.method == "level_up" }.first?.to ?? ""
    identifier = name.isEmpty ? 0 : id + 1
  }
  
}

struct PokemonRawEvolution: Decodable {
  let level: Int
  let method: String
  let to: String
}
