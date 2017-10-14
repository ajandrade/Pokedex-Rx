//
//  PokedexDetailsViewController.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 20/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit
import Action
import RxSwift

class PokedexDetailsViewController: UIViewController {
  
  // MARK: - DEPENDENCIES
  
  var viewModel: PokedexDetailsViewModelRepresentable!
  
  // MARK: - PRIVATE PROPERTIES
  
  private let bag = DisposeBag()
  
  // MARK: - IBOUTLETS
  
  @IBOutlet private weak var dismissButton: UIButton!
  @IBOutlet private weak var pokemonNameLabel: UILabel!
  @IBOutlet private weak var pokemonImageView: UIImageView!
  @IBOutlet private weak var pokemonIdLabel: UILabel!
  @IBOutlet private weak var pokemonTypeLabel: UILabel!
  @IBOutlet private weak var pokemonHeightLabel: UILabel!
  @IBOutlet private weak var pokemonWeightLabel: UILabel!
  @IBOutlet private weak var pokemonStatHpLabel: UILabel!
  @IBOutlet private weak var pokemonStatAttackLabel: UILabel!
  @IBOutlet private weak var pokemonStatDefenseLabel: UILabel!
  @IBOutlet private weak var pokemonStatSpeedLabel: UILabel!
  @IBOutlet private weak var pokemomStatSpecialAttackLabel: UILabel!
  @IBOutlet private weak var pokemomStatSpecialDefenseLabel: UILabel!
  @IBOutlet private weak var pokemonStatHpProgressView: UIProgressView!
  @IBOutlet private weak var pokemonStatAttackProgressView: UIProgressView!
  @IBOutlet private weak var pokemonStatDefenseProgressView: UIProgressView!
  @IBOutlet private weak var pokemonStatSpeedProgressView: UIProgressView!
  @IBOutlet private weak var pokemomStatSpecialAttackProgressView: UIProgressView!
  @IBOutlet private weak var pokemomStatSpecialDefenseProgressView: UIProgressView!
  @IBOutlet private weak var pokemomEvolutionNameLabel: UILabel!
  @IBOutlet private weak var pokemomEvolutionImageView: UIImageView!

  // MARK: - VIEW LIFE CYCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bindActions()
    bindUI()
  }
  
  // MARK: - BINDINGS
  
  private func bindActions() {
    dismissButton.rx.action = viewModel.dismiss
  }
  
  private func bindUI() {
    viewModel.didFinishGettingPokemon  // hide view and error
      .subscribe(onNext: { _ in
        print("Finished")
      }, onError: { error in
        print(error)
      })
      .disposed(by: bag)
    
    viewModel.pokemonName
      .bind(to: pokemonNameLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonIdentifier
      .bind(to: pokemonIdLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonImageName
      .map { UIImage(named: $0) }
      .bind(to: pokemonImageView.rx.image)
      .disposed(by: bag)
    
    viewModel.pokemonType
      .bind(to: pokemonTypeLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonHeight
      .bind(to: pokemonHeightLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonWeight
      .bind(to: pokemonWeightLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonHP
      .bind(to: pokemonStatHpLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonDefense
      .bind(to: pokemonStatDefenseLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonAttack
      .bind(to: pokemonStatAttackLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonSpecialDefense
      .bind(to: pokemomStatSpecialDefenseLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonSpecialAttack
      .bind(to: pokemomStatSpecialAttackLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonSpeed
      .bind(to: pokemonStatSpeedLabel.rx.text)
      .disposed(by: bag)
    
    viewModel.pokemonHPLevel
      .bind(to: pokemonStatHpProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonSpeedLevel
      .bind(to: pokemonStatSpeedProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonAttackLevel
      .bind(to: pokemonStatAttackProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonDefenseLevel
      .bind(to: pokemonStatDefenseProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonSpecialAttackLevel
      .bind(to: pokemomStatSpecialAttackProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonSpecialDefenseLevel
      .bind(to: pokemomStatSpecialDefenseProgressView.rx.progress)
      .disposed(by: bag)
    
    viewModel.pokemonEvolutionName
      .bind(to: pokemomEvolutionNameLabel.rx.text)
      .disposed(by: bag)
    
    let evolutionImageName = viewModel.pokemonEvolutionImageName.share()
    
    evolutionImageName
      .filter { $0 != nil }
      .map { UIImage(named: $0!) }
      .bind(to: pokemomEvolutionImageView.rx.image)
      .disposed(by: bag)
    
    evolutionImageName
      .filter { $0 == nil }
      .map { _ in true }
      .bind(to: pokemomEvolutionImageView.rx.isHidden)
      .disposed(by: bag)
  }
  
}
