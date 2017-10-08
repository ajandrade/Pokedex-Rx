//
//  PrimitiveSequence.swift
//  Pokedex-Rx
//
//  Created by Amadeu Andrade on 06/10/2017.
//  Copyright © 2017 Amadeu Andrade. All rights reserved.
//

import RxSwift
import Moya

public typealias JSON = [String: Any]

extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {

  public func mapJSONAndCast(failsOnEmptyData: Bool = true) -> Single<JSON> {
    return flatMap { response -> Single<JSON> in
      if let jsonResponse = try response.mapJSON(failsOnEmptyData: failsOnEmptyData) as? JSON {
        return Single.just(jsonResponse)
      } else {
        throw MoyaError.jsonMapping(response)
      }
    }
  }

}
