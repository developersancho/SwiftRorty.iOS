//
//  APIEndpoint.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation

enum APIEndpoint {
    case characters(Int)
    
    func path() -> String {
        switch self {
        case .characters(let page): return "character/?page=\(page)"
        }
    }
}
