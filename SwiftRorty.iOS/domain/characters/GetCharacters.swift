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
    @Injected private var characterRepository: CharacterRepository
    @Injected private var favoriteRepository: FavoriteRepository

    func invoke(page: Int) -> AnyPublisher<CharacterListDto, Error> {
        characterRepository.getCharacters(page: page).map { (response: CharacterResponse) in
            let list: [CharacterDto] = response.toCharacterDtoList().map { dto in
                let entity = self.favoriteRepository.getFavorite(id: dto.id)
                return CharacterDto(created: dto.created, episode: dto.episode, gender: dto.gender, id: dto.id, image: dto.image, location: dto.location, name: dto.name, origin: dto.origin, species: dto.species, status: dto.status, type: dto.type, url: dto.url,isFavorite: entity != nil)
            }
            return CharacterListDto(info: response.pageInfo, characters: list)
        }.eraseToAnyPublisher()
    }
}
