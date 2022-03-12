//
//  CharacterDto.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import UIKit

struct CharacterDto: Identifiable {
    var created: String? = nil
    var episode: [String]? = nil
    var gender: String? = nil
    var id: Int = 0
    var image: String? = nil
    var location: Location? = nil
    var name: String? = nil
    var origin: Origin? = nil
    var species: String? = nil
    var status: Status? = nil
    var type: String? = nil
    var url: String? = nil
    var isFavorite: Bool = false
    
    static func defaultDto() -> CharacterDto {
        return CharacterDto(created: nil, episode: nil, gender: nil, id: 1, image: nil, location: nil, name: "Rick Sanchez", origin: nil, species: "Human", status: Status.alive, type: nil, url: nil)
    }
}
