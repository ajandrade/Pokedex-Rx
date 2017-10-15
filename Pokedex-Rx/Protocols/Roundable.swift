//
//  Roundable.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 19/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

protocol Roundable { }

extension Roundable where Self: UIView {

  func rounded(with radius: CGFloat) {
    self.layer.cornerRadius = radius
  }
  
}
