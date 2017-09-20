//
//  AppDelegate.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  
  // swiftlint:disable line_length
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    let navigator = Navigator()
    let rootCoordinator = RootCoordinator(window: window!, navigator: navigator)
    rootCoordinator.start()
    return true
  }
  // swiftlint:enable line_length

}
