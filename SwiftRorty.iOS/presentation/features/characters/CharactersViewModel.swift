//
//  CharactersViewModel.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import Foundation
import UIKit
import Combine
import Resolver

class CharactersViewModel: ObservableObject {
    @Injected private var getCharacters: GetCharacters
    
    @Injected
    private var updateFavorite: UpdateFavorite
    
    //    @Published var charactersList : [CharacterDto] = [] {
    //        willSet {
    //            objectWillChange.send()
    //        }
    //    }
    @Published var charactersList : [CharacterDto] = []
    private var cancelables = [AnyCancellable]()
    private var page = 1
    private var totalPages = 0
    @Published var hasMorePages = false
    
   private func resetPaging() {
        self.page = 1
        self.totalPages = 0
        self.charactersList.removeAll()
    }
    
    func changeIsFavorite(for character: CharacterDto, favor: Bool) {
        objectWillChange.send() // emits a change from the Store
        //character.isFavorite = favor
        self.$charactersList
            .sink(receiveValue: { _ in self.objectWillChange.send() })
            .store(in: &cancelables)
    }
    
    func loadPage() {
        resetPaging()
        getCharacters.invoke(page: page)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] response in
                self?.totalPages = response.info.pages
                self?.page += 1
                self?.charactersList.append(contentsOf: response.characters)
                
            })
            .store(in: &cancelables)
    }
    
    func loadNextPage() {
        if page < totalPages {
            hasMorePages = true
            loadPage()
        }
    }
    
    func updateFavor(dto: CharacterDto, state: Bool) {
        updateFavorite.invoke(dto: dto)
        let index = charactersList.firstIndex(where: { $0.id == dto.id }) ?? 0
        print(index)
        charactersList[index].isFavorite = state
        self.$charactersList
            .sink(receiveValue: { [self] _ in
                objectWillChange.send()
            })
            .store(in: &cancelables)
    }
}
