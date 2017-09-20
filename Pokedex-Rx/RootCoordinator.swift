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
  fileprivate let navigator: NavigatorRepresentable
  
  // MARK: - PROPERTIES
  
  fileprivate let dataDependencies = DataDependencies()
  
  // MARK: - INITIALIZER
  
  init(window: UIWindow, navigator: NavigatorRepresentable) {
    self.window = window
    self.navigator = navigator
    self.window.rootViewController = navigator.root()
    self.window.makeKeyAndVisible()
  }
  
}

extension RootCoordinator: Coordinator {
  
  func start() {
    let pokedexListCoordinator = PokedexListCoordinator(navigator: navigator, dataDependencies: dataDependencies)
    pokedexListCoordinator.start()
  }
  
}
