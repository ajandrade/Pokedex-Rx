//
//  PokemonCellViewModel.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 18/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

protocol PokemonCellViewModelRepresentable {
  var pokemonId: String { get }
  var name: String { get }
  var imageName: String { get }
}

struct PokemonCellViewModel: PokemonCellViewModelRepresentable {
  
  let pokemonId: String
  let name: String
  let imageName: String
  
  init(pokemonLight: PokemonLight) {
    pokemonId = pokemonLight.pokedexId
    name = pokemonLight.name.capitalized
    imageName = pokemonLight.pokedexId
  }
  
}
