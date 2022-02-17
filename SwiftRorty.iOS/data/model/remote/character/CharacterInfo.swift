//
//  CharacterInfo.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct CharacterInfo: Codable {
    let created: String?
    let episode: [String]?
    let gender: String?
    let id: Int?
    let image: String?
    let location: Location?
    let name: String?
    let origin: Origin?
    let species: String?
    let status: Status?
    let type: String?
    let url: String?
}
