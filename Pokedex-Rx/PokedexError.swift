//
//  PokedexError.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

enum PokedexError: Error {
  // Parse
  case fileNotFound
  case parse
}

extension PokedexError: LocalizedError {
  
  public var description: String {
    switch self {
    case .fileNotFound:
      return "The csv doesn't exist."
    case .parse:
      return "There was an error while parsing the csv file."
    }
  }
  
}
