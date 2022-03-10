//
//  FavoritesViewModel.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Resolver

class FavoritesViewModel: ObservableObject {
    @Injected
    private var getFavorites: GetFavorites
    
    @Published
    var favorites: [CharacterDto] = []
    
    func loadFavorites() {
        let list = getFavorites.invoke()
        self.favorites.append(contentsOf: list)
    }
}
