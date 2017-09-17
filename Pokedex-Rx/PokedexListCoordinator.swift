//
//  PokedexListCoordinator.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

class PokedexListCoordinator {

  // MARK: - DEPENDENCIES
  
  fileprivate let navigationController: UINavigationController
  
  // MARK: - INITIALIZER
  
  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }
  
}

extension PokedexListCoordinator: Coordinator {
  
  func start() {
    let pokedexListViewController = PokedexListViewController()
    let pokedexListViewModel = PokedexListViewModel()
    pokedexListViewController.viewModel = pokedexListViewModel
    navigationController.viewControllers = [pokedexListViewController]
  }
  
}
