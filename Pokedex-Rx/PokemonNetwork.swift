//
//  PokemonNetwork.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 06/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Moya
import RxSwift

protocol PokemonNetworkProtocol {
  func getPokemonInformation(with identifier: String) -> Observable<Data>
  func getEvolutions(with identifier: String) -> Observable<Data>
}

struct PokemonNetwork: PokemonNetworkProtocol {

  // MARK: - DEPENDENCIES
  
  private let provider: MoyaProvider<PokemonAPI>
  
  // MARK: - INITIALIZER
  
  init(provider: MoyaProvider<PokemonAPI>) {
    self.provider = provider
  }
  
  // MARK: - METHODS
  
  func getPokemonInformation(with identifier: String) -> Observable<Data> {
    return provider.rx
      .request(.get(id: identifier))
      .debug()
      .filterSuccessfulStatusCodes()
      .retry(3)
      .map { $0.data }
      .asObservable()
  }
  
  func getEvolutions(with identifier: String) -> Observable<Data> {
    return provider.rx
      .request(.getEvolution(id: identifier))
      .debug()
      .filterSuccessfulStatusCodes()
      .retry(3)
      .map { $0.data }
      .asObservable()
  }
  
}
