//
//  CharacterResponse.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.02.2022.
//

import Foundation

struct CharacterResponse: Codable {
    let pageInfo: PageInfo?
    let results: [CharacterInfo]?
}
