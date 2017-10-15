//
//  String.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 06/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

extension String {
  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }
  
  var utf8Encoded: Data {
    return data(using: .utf8)!
  }
}
