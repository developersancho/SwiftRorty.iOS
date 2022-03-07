//
//  DetailViewModel.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 2.03.2022.
//

import Foundation
import UIKit
import Combine
import Resolver
import SwiftUI

class DetailViewModel: ObservableObject {
    @Injected
    private var getCharacterDetail: GetCharacterDetail
    @Published
    var dto: CharacterDto?
    @Published
    var details: [KeyValueModel] = []
    private var cancelables = [AnyCancellable]()
    
    
    func loadDetail(characterId: Int) {
        getCharacterDetail.invoke(characterId: characterId)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.dto = response
                self?.details = self!.getDetails(character: response)
            })
            .store(in: &cancelables)
    }
    
    func getDetails(character: CharacterDto) -> [KeyValueModel] {
        var list: [KeyValueModel] = []
        list.append(
            KeyValueModel(
                id: 0,
                key: LocalizedStringKey("text_name").toString(),
                value: character.name
            )
        )
        list.append(
            KeyValueModel(
                id: 1,
                key: LocalizedStringKey("text_species").toString(),
                value: character.species
            )
        )
        list.append(
            KeyValueModel(
                id: 2,
                key: LocalizedStringKey("text_gender").toString(),
                value: character.gender
            )
        )
        list.append(
            KeyValueModel(
                id: 3,
                key: LocalizedStringKey("text_last_know_location").toString(),
                value: character.origin?.name ?? "-"
            )
        )
        list.append(
            KeyValueModel(
                id: 4,
                key: LocalizedStringKey("text_location").toString(),
                value: character.location?.name ?? "-"
            )
        )
        
        return list
    }
}
