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

class PokedexListViewController: UIViewController, Alertable {
  
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
    bindCollectionView()
    bindSearchBar()
  }
  
  // MARK: - BINDINGS
  
  private func bindCollectionView() {
    
    viewModel.dataSource
      .catchError { [weak self] error in
        if let err = error as? PokedexError {
          self?.showAlert(with: err.description)
        } else {
          self?.showAlert(with: error.localizedDescription)
        }
        return Observable.empty()
      }
      .bind(to: collectionView.rx.items(cellIdentifier: PokemonCell.identifier, cellType: PokemonCell.self)) { (_, model, cell) in
        cell.configure(with: model)
      }
      .disposed(by: bag)
    
    collectionView.rx
      .modelSelected(PokemonCellViewModelRepresentable.self)
      .bind(to: viewModel.showDetails.inputs)
      .disposed(by: bag)
    
  }
  
  private func bindSearchBar() {
    searchBar.rx
      .text
      .orEmpty
      .skip(1)
      .bind(to: viewModel.textToSearch)
      .disposed(by: bag)
    
    searchBar.rx
      .searchButtonClicked
      .subscribe(onNext: { [weak self] _ in self?.view.endEditing(true) })
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
