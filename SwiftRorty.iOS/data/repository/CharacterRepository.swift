//
//  CharacterRepository.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine

class CharacterRepository {
    private let remoteService: CharacterService = CharacterServiceImpl()
    
//    init(_ remoteService: CharacterService = CharacterServiceImpl()) {
//        self.remoteService = remoteService
//    }
    
    func getCharacters(page: Int) -> AnyPublisher<CharacterListDto, Error> {
        remoteService.getCharacters(page: page)
    }
}
