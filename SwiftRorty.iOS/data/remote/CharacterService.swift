//
//  CharacterService.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import Foundation
import Combine

protocol CharacterService {
    func getCharacters(page: Int) -> AnyPublisher<[CharacterDto]?, BaseError>
}

class CharacterServiceImpl: CharacterService {
    
    private let apiClient: APIClient
    
    init(_ apiClient: APIClient = APIClientImpl()) {
        self.apiClient = apiClient
    }
    
    func getCharacters(page: Int) -> AnyPublisher<[CharacterDto]?, BaseError> {
        requestGetCharacters(page: page).map { $0.toCharacterDtoList() }.eraseToAnyPublisher()
    }
    
    private func requestGetCharacters(page: Int) -> AnyPublisher<CharacterResponse, BaseError> {
        apiClient.request(URLRequest(APIEndpoint.characters(page), APIMethod.get))
    }
}
