//
//  LocationResponse.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct LocationResponse: Codable {
    let pageInfo: PageInfo?
    let location: [LocationInfo]?
    
    enum CodingKeys: String, CodingKey {
        case pageInfo = "pageInfo"
        case location = "results"
    }
}
