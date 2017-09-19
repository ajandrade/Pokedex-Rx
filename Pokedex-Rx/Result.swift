//
//  Result.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 19/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(Error)
}
