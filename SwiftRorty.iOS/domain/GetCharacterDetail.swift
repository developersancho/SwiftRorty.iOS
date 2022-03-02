//
//  GetCharacterDetail.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 2.03.2022.
//

import Foundation
import Combine
import Resolver

class GetCharacterDetail {
    @Injected private var repository: CharacterRepository
    
    func invoke(characterId: Int) -> AnyPublisher<CharacterDto, Error> {
        repository.getCharacter(characterId: characterId).map { (response: CharacterInfo) in
            response.toCharacterDto()
        }.eraseToAnyPublisher()
    }
}
