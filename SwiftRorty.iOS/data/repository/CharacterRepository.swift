//
//  CharacterRepository.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine
import Resolver

class CharacterRepository {
    @Injected private var remoteService: CharacterService

    func getCharacters(page: Int) -> AnyPublisher<CharacterResponse, Error> {
        remoteService.getCharacters(page: page)
    }
    
    func getCharacter(characterId: Int) -> AnyPublisher<CharacterInfo, Error> {
        remoteService.getCharacter(characterId: characterId)
    }
}
