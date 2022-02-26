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
    func getCharacters(page: Int) -> AnyPublisher<CharacterListDto, Error>
}

class CharacterServiceImpl: CharacterService {
    
    //private let restClient = RestClientImpl()
    
    @Injected private var restClient: RestClient
    
    func getCharacters(page: Int) -> AnyPublisher<CharacterListDto, Error> {
        //requestGetCharacters(page: page).map { $0.toCharacterDtoList() }.eraseToAnyPublisher()
        restClient.get(APIEndpoint.characters(page)).map { (response: CharacterResponse) in
            CharacterListDto(info: response.pageInfo, characters: response.toCharacterDtoList())
        }.eraseToAnyPublisher()
    }
    
//    private func requestGetCharacters(page: Int) -> AnyPublisher<CharacterResponse, BaseError> {
//        apiClient.request(URLRequest(APIEndpoint.characters(page), APIMethod.get))
//    }
}
