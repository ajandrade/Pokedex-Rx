//
//  DataProtocols.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Foundation

protocol HasNetworkService {
  var networkService: PokemonNetworkProtocol { get }
}

protocol HasParsingService {
  var parserService: PokemonParserProtocol { get }
}
