//
//  PokedexListViewController.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

class PokedexListViewController: UIViewController {
  
  // MARK: - DEPENDENCIES
  
  var viewModel: PokedexListViewModelRepresentable!
  
  // MARK: - IBOUTLETS
  
  @IBOutlet private weak var collectionView: UICollectionView!
  @IBOutlet private weak var musicButton: UIButton!
  @IBOutlet private weak var searchBar: UISearchBar!
  
  // MARK: - VIEW LIFE CYCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

extension PokedexListViewController: UICollectionViewDelegateFlowLayout {
  
  // swiftlint:disable line_length
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 105.0, height: 105.0)
  }
  // swiftlint:enable line_length
  
}
