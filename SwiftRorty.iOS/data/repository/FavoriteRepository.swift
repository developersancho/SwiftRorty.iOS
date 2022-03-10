//
//  FavoriteRepository.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 9.03.2022.
//

import Foundation
import Resolver

class FavoriteRepository {
    @Injected
    private var coreDataManager: CoreDataManager
    
    func saveFavorite(id: Int, status: String?, gender: String?, name: String?, imageUrl: String?, species: String?) {
        coreDataManager.saveFavorite(id: id, status: status, gender: gender, name: name, imageUrl: imageUrl, species: species)
    }
    
    func deleteFavorite(id: Int) {
        coreDataManager.deleteFavorite(id: id)
    }
    
    func getFavoriteList() -> [FavoriteEntity] {
        return coreDataManager.getFavoriteList()
    }
    
    func getFavorite(id: Int) -> FavoriteEntity? {
        return coreDataManager.getFavorite(id: id)
    }
}
