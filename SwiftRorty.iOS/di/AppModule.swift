//
//  AppModule.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 27.02.2022.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        registerSingletons()
        registerRemote()
        registerRepository()
        registerDomain()
    }
    
    private static func registerSingletons() {
        register { RestClientImpl() as RestClient }.scope(.application)
        register { CoreDataManager() }.scope(.application)
    }
    
    private static func registerRemote() {
        register { CharacterServiceImpl() as CharacterService }
    }
    
    private static func registerRepository() {
        register { CharacterRepository() }
        register { FavoriteRepository() }
    }
    
    private static func registerDomain() {
        register { GetCharacters() }
        register { GetCharacterDetail() }
        register { GetFavorites() }
        register { UpdateFavorite() }
        register { DeleteFavorite() }
    }
    
}
