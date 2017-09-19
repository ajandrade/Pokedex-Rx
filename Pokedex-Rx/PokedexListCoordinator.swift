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
  fileprivate let dataDependencies: DataDependencies
  
  // MARK: - INITIALIZER
  
  init(navigationController: UINavigationController, dataDependencies: DataDependencies) {
    self.navigationController = navigationController
    self.dataDependencies = dataDependencies
  }
  
}

extension PokedexListCoordinator: Coordinator {
  
  func start() {
    let pokedexListViewController = PokedexListViewController()
    let pokedexListViewModel = PokedexListViewModel(dataDependencies: dataDependencies)
    pokedexListViewController.viewModel = pokedexListViewModel
    navigationController.viewControllers = [pokedexListViewController]
  }
  
}
