//
//  PokedexDetailsCoordinator.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 19/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit
import RxSwift
import Action

protocol PokedexDetailsNavigation {
  var dismiss: CocoaAction { get }
}

class PokedexDetailsCoordinator {

  // MARK: - DEPENDENCIES
  
  fileprivate let navigator: NavigatorRepresentable
  fileprivate let dataDependencies: DataDependencies
  fileprivate let pokemonId: String
  
  // MARK: - NAVIGATION
  
  fileprivate struct Navigation: PokedexDetailsNavigation {
    let dismiss: CocoaAction
  }

  // MARK: - INITIALIZER
  
  init(navigator: NavigatorRepresentable, dataDependencies: DataDependencies, pokemonId: String) {
    self.navigator = navigator
    self.dataDependencies = dataDependencies
    self.pokemonId = pokemonId
  }
  
}

extension PokedexDetailsCoordinator: Coordinator {

  func start() {
    let pokedexDetailsViewController = PokedexDetailsViewController()
    
    let dismiss = CocoaAction {
      self.navigator.dismiss()
      return Observable.empty()
    }
    
    let navigation = Navigation(dismiss: dismiss)
    
    let pokedexDetailsViewModel = PokedexDetailsViewModel(dataDependencies: dataDependencies, navigation: navigation, pokemonId: pokemonId)
    pokedexDetailsViewController.viewModel = pokedexDetailsViewModel
    navigator.transition(to: pokedexDetailsViewController, type: .push)
  }
  
}
