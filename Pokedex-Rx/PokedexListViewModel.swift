//
//  PokedexListViewModel.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

protocol PokedexListViewModelRepresentable {
  // Inputs
  var textToSearch: PublishSubject<String> { get }
  // Outputs
  var dataSource: Observable<[PokemonCellViewModelRepresentable]> { get }
  var showDetails: Action<PokemonCellViewModelRepresentable, Void> { get }
}

class PokedexListViewModel: PokedexListViewModelRepresentable {

  // MARK: - DEPENDENCIES
  
  typealias DependenciesList = HasParsingService
  private let dataDependencies: DependenciesList
  
  // MARK: - PRIVATE PROPERTIES
  
  private let bag = DisposeBag()
  private let allData: [PokemonCellViewModelRepresentable]
  private var inputDataSource = BehaviorSubject<[PokemonCellViewModelRepresentable]>(value: [])

  // MARK: - INPUT PROPERTIES
  
  let textToSearch = PublishSubject<String>()

  // MARK: - OUTPUT PROPERTIES
  
  var dataSource: Observable<[PokemonCellViewModelRepresentable]> {
    return inputDataSource.asObservable()
  }
  var showDetails: Action<PokemonCellViewModelRepresentable, Void>
  
  // MARK: - INITIALIZER
  
  init(dataDependencies: DependenciesList, navigation: PokedexListNavigation) {
    self.dataDependencies = dataDependencies
    
    let parsedData = dataDependencies.parserService.parsePokemonFile()
    
    switch parsedData {
    case .success(let list):
      allData = list.map(PokemonCellViewModel.init)
      inputDataSource.onNext(allData)
    case .failure(let err):
      allData = []
      inputDataSource.onError(err)
    }
    
    showDetails = Action { cellViewModel in
      let id = cellViewModel.pokemonId
      return navigation.showDetails.execute(id)
    }
    
    textToSearch
      .subscribe(onNext: { text in
        let filteredData = self.allData.filter { $0.name.hasPrefix(text) }
        self.inputDataSource.onNext(filteredData)
      })
      .disposed(by: bag)
    
  }


}
