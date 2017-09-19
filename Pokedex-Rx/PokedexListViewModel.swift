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

protocol PokedexListViewModelRepresentable {

  var dataSource: Observable<[PokemonCellViewModelRepresentable]> { get }
  
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
  
  
  // MARK: - OUTPUT PROPERTIES
  
  var dataSource: Observable<[PokemonCellViewModelRepresentable]> {
    return inputDataSource.asObservable()
  }
  
  // MARK: - INITIALIZER
  
  init(dataDependencies: DependenciesList) {
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

  }


}
