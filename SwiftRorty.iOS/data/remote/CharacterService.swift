//
//  CharacterService.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine
import Resolver

protocol CharacterService {
    func getCharacters(page: Int) -> AnyPublisher<CharacterResponse, Error>
    func getCharacter(characterId: Int) -> AnyPublisher<CharacterInfo, Error>
}

class CharacterServiceImpl: CharacterService {
    @Injected private var restClient: RestClient
    
    func getCharacters(page: Int) -> AnyPublisher<CharacterResponse, Error> {
        restClient.get(APIEndpoint.characters(page))
    }
    
    func getCharacter(characterId: Int) -> AnyPublisher<CharacterInfo, Error> {
        restClient.get(APIEndpoint.character(characterId))
    }
}
