//
//  GetCharacters.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine
import Resolver

class GetCharacters {
    @Injected private var repository: CharacterRepository

    func invoke(page: Int) -> AnyPublisher<CharacterListDto, Error> {
        repository.getCharacters(page: page).map { (response: CharacterResponse) in
            CharacterListDto(info: response.pageInfo, characters: response.toCharacterDtoList())
        }.eraseToAnyPublisher()
    }
}
