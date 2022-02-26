//
//  RestClientErrors.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 26.02.2022.
//

import Foundation

enum RestClientErrors: Error {
    case requestFailed(error: Error)
    case requestFailed(code: Int)
    case noDataReceived
    case jsonDecode(error: Error)
}
