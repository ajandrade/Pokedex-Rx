//
//  PokemonLight.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

struct PokemonLight {
  
  // MARK: - PROPERTIES
  
  let pokedexId: String
  let name: String
  
  var image: UIImage? {
    return UIImage(named: "\(pokedexId)")
  }

}
