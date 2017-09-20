//
//  PokedexDetailsViewModel.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 20/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation
import RxSwift
import Action

protocol PokedexDetailsViewModelRepresentable {
  // Output
  var dismiss: CocoaAction { get }
}

struct PokedexDetailsViewModel: PokedexDetailsViewModelRepresentable {

  // MARK: - DEPENDENCIES
  
  typealias DependenciesList = HasNetworkService
  private let dataDependencies: DependenciesList
  private let navigation: PokedexDetailsNavigation
  private let pokemonId: String
  
  // MARK: - OUTPUT PROPERTIES
  
  let dismiss: CocoaAction

  // MARK: - INITIALIZER
  
  init(dataDependencies: DependenciesList, navigation: PokedexDetailsNavigation, pokemonId: String) {
    self.dataDependencies = dataDependencies
    self.navigation = navigation
    self.pokemonId = pokemonId
    
    dismiss = navigation.dismiss
  }
  
}
