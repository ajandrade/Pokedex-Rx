//
//  PokedexDetailsViewModel.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 20/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation
import RxSwift
import Action

protocol PokedexDetailsViewModelRepresentable {
  var dismiss: CocoaAction { get }
  var didFinishGettingPokemon: Observable<Void>! { get }
  var pokemonName: Observable<String>! { get }
  var pokemonIdentifier: Observable<String>! { get }
  var pokemonImageName: Observable<String>! { get }
  var pokemonHeight: Observable<String>! { get }
  var pokemonWeight: Observable<String>! { get }
  var pokemonType: Observable<String>! { get }
  var pokemonSpeed: Observable<String>! { get }
  var pokemonSpecialDefense: Observable<String>! { get }
  var pokemonSpecialAttack: Observable<String>! { get }
  var pokemonDefense: Observable<String>! { get }
  var pokemonAttack: Observable<String>! { get }
  var pokemonHP: Observable<String>! { get }
  var pokemonSpeedLevel: Observable<Float>! { get }
  var pokemonSpecialDefenseLevel: Observable<Float>! { get }
  var pokemonSpecialAttackLevel: Observable<Float>! { get }
  var pokemonDefenseLevel: Observable<Float>! { get }
  var pokemonAttackLevel: Observable<Float>! { get }
  var pokemonHPLevel: Observable<Float>! { get }
  var pokemonEvolutionName: Observable<String>! { get }
  var pokemonEvolutionImageName: Observable<String?>! { get }
}

struct PokedexDetailsViewModel: PokedexDetailsViewModelRepresentable {
  
  // MARK: - DEPENDENCIES
  
  typealias DependenciesList = HasNetworkService
  private let dataDependencies: DependenciesList
  private let navigation: PokedexDetailsNavigation
  
  // MARK: - PRIVATE PROPERTIES
  
  private let bag = DisposeBag()

  // MARK: - OUTPUT PROPERTIES
  
  private(set) var dismiss: CocoaAction
  
  private(set) var didFinishGettingPokemon: Observable<Void>!

  private(set) var pokemonName: Observable<String>!
  private(set) var pokemonIdentifier: Observable<String>!
  private(set) var pokemonImageName: Observable<String>!
  private(set) var pokemonHeight: Observable<String>!
  private(set) var pokemonWeight: Observable<String>!
  private(set) var pokemonType: Observable<String>!
  private(set) var pokemonSpeed: Observable<String>!
  private(set) var pokemonSpecialDefense: Observable<String>!
  private(set) var pokemonSpecialAttack: Observable<String>!
  private(set) var pokemonDefense: Observable<String>!
  private(set) var pokemonAttack: Observable<String>!
  private(set) var pokemonHP: Observable<String>!
  private(set) var pokemonSpeedLevel: Observable<Float>!
  private(set) var pokemonSpecialDefenseLevel: Observable<Float>!
  private(set) var pokemonSpecialAttackLevel: Observable<Float>!
  private(set) var pokemonDefenseLevel: Observable<Float>!
  private(set) var pokemonAttackLevel: Observable<Float>!
  private(set) var pokemonHPLevel: Observable<Float>!
  private(set) var pokemonEvolutionName: Observable<String>!
  private(set) var pokemonEvolutionImageName: Observable<String?>!
  
  // MARK: - INITIALIZER
  
  init(dataDependencies: DependenciesList, navigation: PokedexDetailsNavigation, pokemonId: String) {
    self.dataDependencies = dataDependencies
    self.navigation = navigation
    
    dismiss = navigation.dismiss
    
    let pokemonInfo = getPokemonInfo(with: pokemonId)
      .share()
    
    pokemonName = pokemonInfo.map { $0.name.capitalized }
    pokemonIdentifier = pokemonInfo.map { "\($0.identifier)" }
    pokemonImageName = pokemonInfo.map { "\($0.identifier)" }
    pokemonHeight = pokemonInfo.map { "\($0.height)" }
    pokemonWeight = pokemonInfo.map { "\($0.weight)" }
    pokemonType = pokemonInfo.map { $0.type.name.capitalized }
    
    pokemonSpeed  = pokemonInfo.map { "\($0.stats.speed)" }
    pokemonSpecialDefense  = pokemonInfo.map { "\($0.stats.specialDefense)" }
    pokemonSpecialAttack  = pokemonInfo.map { "\($0.stats.specialAttack)" }
    pokemonAttack  = pokemonInfo.map { "\($0.stats.attack)" }
    pokemonDefense  = pokemonInfo.map { "\($0.stats.defense)" }
    pokemonHP  = pokemonInfo.map { "\($0.stats.healthPoints)" }
    
    pokemonSpeedLevel = pokemonInfo.map { Float($0.stats.speed)/200 }
    pokemonSpecialAttackLevel = pokemonInfo.map { Float($0.stats.specialAttack)/200 }
    pokemonSpecialDefenseLevel = pokemonInfo.map { Float($0.stats.specialDefense)/200 }
    pokemonDefenseLevel = pokemonInfo.map { Float($0.stats.defense)/200 }
    pokemonAttackLevel = pokemonInfo.map { Float($0.stats.attack)/200 }
    pokemonHPLevel = pokemonInfo.map { Float($0.stats.healthPoints)/200 }
    
    pokemonEvolutionName = pokemonInfo.map { $0.evolution?.name ?? "No evolution" }
    pokemonEvolutionImageName = pokemonInfo.map { return ($0.evolution != nil) ? "\($0.evolution!.identifier)" : nil }
    
    didFinishGettingPokemon = pokemonInfo.map { _ in Void() }
    
  }
  
  // MARK: - METHODS
  
  private func getPokemonInfo(with pokemonId: String) -> Observable<Pokemon> {
    let infoRequest = getInformation(with: pokemonId)
    let evolutionRequest = getEvolutions(with: pokemonId)
    return Observable.combineLatest(infoRequest, evolutionRequest) { infoResponse, evolutionResponse -> Pokemon in
      let jsonDecoder = JSONDecoder()
      let evolution = try jsonDecoder.decode(PokemonEvolution.self, from: evolutionResponse)
      let pokemon = try jsonDecoder.decode(Pokemon.self, from: infoResponse)
      if evolution.name.isEmpty { return pokemon }
      return pokemon.updateEvolution(evolution)
    }
  }
  
  private func getInformation(with identifier: String) -> Observable<Data> {
    return dataDependencies.networkService.getPokemonInformation(with: identifier)
  }
  
  private func getEvolutions(with identifier: String) -> Observable<Data> {
    return dataDependencies.networkService.getEvolutions(with: identifier)
  }
  
  
}
