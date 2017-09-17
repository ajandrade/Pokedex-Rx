//
//  RootCoordinator.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

class RootCoordinator {

  // MARK: - DEPENDENCIES
  
  private let window: UIWindow
  
  // MARK: - PROPERTIES
  
  fileprivate let navigationController: UINavigationController = {
    let navController = UINavigationController()
    navController.setNavigationBarHidden(true, animated: false)
    return navController
  }()
  
  // MARK: - INITIALIZER
  
  init(window: UIWindow) {
    self.window = window
    self.window.rootViewController = navigationController
    self.window.makeKeyAndVisible()
  }
  
}

extension RootCoordinator: Coordinator {
  
  func start() {
    let pokedexListCoordinator = PokedexListCoordinator(navigationController: navigationController)
    pokedexListCoordinator.start()
  }
  
}
