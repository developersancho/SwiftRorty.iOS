//
//  APIEndpoint.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation

/// BaseUrl of Rick and Morty API Endpoint
private let baseURL = URL(string: "https://rickandmortyapi.com/api/")


enum APIEndpoint: Endpoint {
    var url: URL {
        return URL(string: self.path, relativeTo: baseURL)!
    }
    
    var path: String {
        switch self {
        case .characters(let page): return "character/?page=\(page)"
        case .character(let id): return "character/\(id)"
        case .locations: return "location"
        case .location(let id): return "location/\(id)"
        }
    }
    
    case characters(Int)
    case character(Int)
    case locations
    case location(Int)
}
