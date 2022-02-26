//
//  APIClient.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import Combine

protocol APIClient {
    func request<T: Decodable>(_ urlRequest: URLRequest) -> AnyPublisher<T, BaseError>
}
