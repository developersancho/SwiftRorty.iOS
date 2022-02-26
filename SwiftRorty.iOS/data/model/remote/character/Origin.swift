//
//  Origin.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct Origin: Codable {
    let name: String?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
}
