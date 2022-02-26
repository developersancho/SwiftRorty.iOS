//
//  Decoder.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import Combine

class Decoder {
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, BaseError> {
        let decoder = JSONDecoder()
        
        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError({ .parse(description: $0.localizedDescription) })
            .eraseToAnyPublisher()
    }
}
