//
//  PokemonAPI.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 06/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import Moya

enum PokemonAPI {
  case get(id: String)
  case getEvolution(id: String)
}

extension PokemonAPI: TargetType {
  var baseURL: URL { return URL(string: "http://pokeapi.co/api/")! }
  var path: String {
    switch self {
    case .get(let id):
      return "v2/pokemon/\(id)"
    case .getEvolution(let id):
      return "v1/pokemon/\(id)"
    }
  }
  var method: Moya.Method {
    switch self {
    case .get, .getEvolution:
      return .get
    }
  }
  var task: Task {
    switch self {
    case .get, .getEvolution:
      return .requestPlain
    }
  }
  var sampleData: Data {
    switch self {
    case .get:
      return "".utf8Encoded
    case .getEvolution:
      return "".utf8Encoded
    }
  }
  var headers: [String: String]? {
    return nil
  }
}
