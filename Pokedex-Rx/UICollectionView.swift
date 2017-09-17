//
//  UICollectionView.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  func register<T: UICollectionViewCell>(_: T.Type) where T: Identifiable {
    let nib = UINib(nibName: T.identifier, bundle: nil)
    register(nib, forCellWithReuseIdentifier: T.identifier)
  }
  
  func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Identifiable {
    guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeuce cell with id: \(T.identifier)")
    }
    return cell
  }
  
}
