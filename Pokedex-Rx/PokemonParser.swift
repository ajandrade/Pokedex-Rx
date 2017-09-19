//
//  PokemonParser.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 17/09/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import RxSwift

protocol PokemonParserProtocol {
  func parsePokemonFile() -> Result<[PokemonLight]>
}

struct PokemonParser: PokemonParserProtocol {
  
  // MARK: - PROPERTIES
  
  private enum File: String {
    case pokemon
    
    var type: String {
      switch self {
      case .pokemon:
        return "csv"
      }
    }
  }
  
  private enum Field: String { case identifier, id }
  
  // MARK: - METHODS
  
  func parsePokemonFile() -> Result<[PokemonLight]> {
    guard let path = Bundle.main.path(forResource: File.pokemon.rawValue, ofType: File.pokemon.type) else {
      return .failure(PokedexError.fileNotFound)
    }
    do {
      let csv = try CSVParser(contentsOfURL: path)
      var pokemonList = [PokemonLight]()
      csv.rows.forEach { row in
        guard let name = row[Field.identifier.rawValue], let id = row[Field.id.rawValue] else { return }
        let pokemon = PokemonLight(pokedexId: id, name: name)
        pokemonList.append(pokemon)
      }
      return .success(pokemonList)
    } catch {
      return .failure(PokedexError.parse)
    }
  }
  
}
