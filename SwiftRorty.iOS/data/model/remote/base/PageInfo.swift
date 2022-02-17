//
//  PageInfo.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation

struct PageInfo: Codable {
    let count: Int?
    let next: String?
    let pages: Int?
    let prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case next = "next"
        case pages = "pages"
        case prev = "prev"
    }
}
