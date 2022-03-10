//
//  GetFavorites.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 10.03.2022.
//

import Foundation
import Resolver

class GetFavorites {
    @Injected
    private var repository: FavoriteRepository
    
    func invoke() -> [CharacterDto] {
      return repository.getFavoriteList().map { (entity: FavoriteEntity) in
           entity.toCharacterDto()
       }
    }
}
