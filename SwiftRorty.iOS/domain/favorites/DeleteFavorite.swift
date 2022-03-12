//
//  DeleteFavorite.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 12.03.2022.
//

import Foundation
import Resolver

class DeleteFavorite {
    @Injected
    private var repository: FavoriteRepository
    
    func invoke(id: Int) {
        repository.deleteFavorite(id: id)
    }
}
