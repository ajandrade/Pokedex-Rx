//
//  PokedexListViewController.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PokedexListViewController: UIViewController {
  
  // MARK: - DEPENDENCIES
  
  var viewModel: PokedexListViewModelRepresentable!
  
  // MARK: - PROPERTIES
  
  private let bag = DisposeBag()
  
  // MARK: - IBOUTLETS
  
  @IBOutlet private weak var collectionView: UICollectionView! {
    didSet {
      collectionView.register(PokemonCell.self)
    }
  }
  @IBOutlet private weak var musicButton: UIButton!
  @IBOutlet private weak var searchBar: UISearchBar!
  
  // MARK: - VIEW LIFE CYCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
        
    viewModel.dataSource.asObservable()
      .bind(to: collectionView.rx.items(cellIdentifier: PokemonCell.identifier, cellType: PokemonCell.self))
      { (_, model, cell) in
        cell.configure(with: model)
      }
      .disposed(by: bag)
  }
  
}

extension PokedexListViewController: UICollectionViewDelegateFlowLayout {
  
  // swiftlint:disable line_length
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 105.0, height: 105.0)
  }
  // swiftlint:enable line_length
  
}
