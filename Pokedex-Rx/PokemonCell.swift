//
//  PokemonCell.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell, Roundable {
  
  // MARK: - IBOUTLETS
  
  @IBOutlet private weak var pokemonNameLabel: UILabel!
  @IBOutlet private weak var pokemonImageView: UIImageView!
  
  // MARK: - INITIALIZATION
  
  override func awakeFromNib() {
    super.awakeFromNib()
    rounded(with: 3.0)
  }
  
  // MARK: - CONFIGURATION
  
  func configure(with viewModel: PokemonCellViewModelRepresentable) {
    pokemonNameLabel.text = viewModel.name
    pokemonImageView.image = UIImage(named: viewModel.imageName)
  }
  
  // MARK: - REUSE
  
  override func prepareForReuse() {
    pokemonNameLabel.text = ""
    pokemonImageView.image = nil
    super.prepareForReuse()
  }

}
