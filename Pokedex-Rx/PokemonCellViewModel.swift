//
//  PokemonCellViewModel.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 18/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

protocol PokemonCellViewModelRepresentable {
  var name: String { get }
  var imageName: String { get }
}

struct PokemonCellViewModel: PokemonCellViewModelRepresentable {

  let pokemonLight: PokemonLight
  
  let name: String
  let imageName: String
  
  init(pokemonLight: PokemonLight) {
    self.pokemonLight = pokemonLight
    name = pokemonLight.name.capitalized
    imageName = pokemonLight.pokedexId
  }
  
}
