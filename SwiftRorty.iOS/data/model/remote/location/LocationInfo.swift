//
//  LocationInfo.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct LocationInfo: Codable {
    let dimension: String?
    let residents: [String]?
    let created: String?
    let type: String?
    let id: Int?
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case dimension = "dimension"
        case residents = "residents"
        case created = "created"
        case type = "type"
        case id = "id"
        case name = "name"
        case url = "url"
    }
}
