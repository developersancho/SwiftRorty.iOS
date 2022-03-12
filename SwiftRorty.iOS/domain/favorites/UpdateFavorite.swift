//
//  UpdateFavorite.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 10.03.2022.
//

import Foundation
import Resolver

class UpdateFavorite {
    @Injected
    private var repository: FavoriteRepository
    
    func invoke(dto: CharacterDto) {
        let entity = repository.getFavorite(id: dto.id)
        if entity == nil {
            repository.saveFavorite(id: dto.id, status: dto.status?.rawValue, gender: dto.gender, name: dto.name, imageUrl: dto.image, species: dto.species)
        } else {
            repository.deleteFavorite(id: dto.id)
        }
    }
}
