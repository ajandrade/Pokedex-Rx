//
//  Identifiable.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

protocol Identifiable { }

extension Identifiable {
  
  static var identifier: String {
    return String(describing: self)
  }
  
}

