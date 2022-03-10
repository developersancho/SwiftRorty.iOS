//
//  CharacterDto.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import UIKit

struct CharacterDto: Identifiable {
    let created: String?
    let episode: [String]?
    let gender: String?
    let id: Int
    let image: String?
    let location: Location?
    let name: String?
    let origin: Origin?
    let species: String?
    let status: Status?
    let type: String?
    let url: String?
    var isFavorite: Bool = false
    
    static func defaultDto() -> CharacterDto {
        return CharacterDto(created: nil, episode: nil, gender: nil, id: 1, image: nil, location: nil, name: "Rick Sanchez", origin: nil, species: "Human", status: Status.alive, type: nil, url: nil)
    }
}
