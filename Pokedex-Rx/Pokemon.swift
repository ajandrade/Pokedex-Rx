//
//  Pokemon.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 22/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

struct Pokemon {
  let identifier: String
  let name: String
  let height: String
  let weight: String
  let type: [PokemonType]
  let stats: [Statistic]
}
