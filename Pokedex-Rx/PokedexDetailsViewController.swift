//
//  PokedexDetailsViewController.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 20/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import UIKit
import Action

class PokedexDetailsViewController: UIViewController {
  
  // MARK: - DEPENDENCIES
  
  var viewModel: PokedexDetailsViewModelRepresentable!
  
  // MARK: - IBOUTLETS
  
  @IBOutlet private weak var dismissButton: UIButton!
  
  // MARK: - VIEW LIFE CYCLE
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dismissButton.rx.action = viewModel.dismiss
  }
  
}
