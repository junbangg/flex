//
//  Parsing.swift
//  flex
//
//  Created by Jun suk Bang on 2020/08/27.
//  Copyright © 2020 Jun Bang. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, APIError> {
  let decoder = JSONDecoder()
//  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parseError(error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
