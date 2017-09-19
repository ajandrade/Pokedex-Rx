//
//  Alertable.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 19/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

protocol Alertable { }

extension Alertable where Self: UIViewController {

  func showAlert(with message: String) {
    let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
    alert.addAction(dismissAction)
    self.present(alert, animated: true, completion: nil)
  }
  
}
