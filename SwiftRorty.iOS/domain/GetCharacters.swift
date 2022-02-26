//
//  GetCharacters.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine

class GetCharacters {
    private let repository: CharacterRepository = CharacterRepository()
    
//    init(_ repository: CharacterRepository = CharacterRepository()) {
//        self.repository = repository
//    }
    
    func invoke(page: Int) -> AnyPublisher<CharacterListDto, Error> {
        repository.getCharacters(page: page)
    }
}
