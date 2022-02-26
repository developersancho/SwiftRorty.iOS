//
//  APIClientImpl.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import Combine

class APIClientImpl: APIClient {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T>(_ urlRequest: URLRequest) -> AnyPublisher<T, BaseError> where T : Decodable {
        session.dataTaskPublisher(for: urlRequest)
            .mapError({ .api(description: $0.localizedDescription) })
            .flatMap { response in
                Decoder().decode(response.data)
            }.eraseToAnyPublisher()
    }
}
