//
//  CharacterRepository.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine

class CharacterRepository {
    private let remoteService: CharacterService
    
    init(_ remoteService: CharacterService = CharacterServiceImpl()) {
        self.remoteService = remoteService
    }
    
    func getCharacters(page: Int) -> AnyPublisher<[CharacterDto]?, BaseError> {
        remoteService.getCharacters(page: page)
    }
}
