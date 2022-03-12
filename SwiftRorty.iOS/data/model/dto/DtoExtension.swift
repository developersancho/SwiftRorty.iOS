//
//  DtoExtension.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 25.02.2022.
//

import Foundation
import SwiftUI

extension CharacterResponse {
    func toCharacterDtoList() -> [CharacterDto] {
        results.map { $0.toCharacterDto() }
    }
}

extension CharacterInfo {
    func toCharacterDto() -> CharacterDto {
        return .init(created: created, episode: episode, gender: gender, id: id!, image: image, location: location, name: name, origin: origin, species: species, status: status, type: type, url: url)
    }
}

extension Location {
    func toLocationDto() -> LocationDto {
        return .init(locationId: 0, name: name, url: url)
    }
}

extension Origin {
    func toLocationDto() -> LocationDto {
        return .init(locationId: 0, name: name, url: url)
    }
}

extension FavoriteEntity {
    func toCharacterDto() -> CharacterDto {
        return .init(created: nil, episode: nil, gender: gender, id: Int(id), image: imageUrl, location: nil, name: name, origin: nil, species: species, status: Status.init(rawValue: status!), type: nil, url: nil)
    }
}
