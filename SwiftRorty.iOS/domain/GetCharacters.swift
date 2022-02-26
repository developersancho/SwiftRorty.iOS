//
//  GetCharacters.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine

class GetCharacters {
    private let repository: CharacterRepository
    
    init(_ repository: CharacterRepository = CharacterRepository()) {
        self.repository = repository
    }
    
    func invoke(page: Int) -> AnyPublisher<[CharacterDto]?, BaseError> {
        repository.getCharacters(page: page)
    }
}
