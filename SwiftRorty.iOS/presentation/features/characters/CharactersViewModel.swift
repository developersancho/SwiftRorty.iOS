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
    //    private let getCharacters: GetCharacters = GetCharacters()
    //    private var disposables = Set<AnyCancellable>()
    //
    //    @Published var dataSource: [CharacterDto]
    //
    //    init(_ getCharacters: GetCharacters = GetCharacters()){
    //        self.dataSource = []
    //        self.getCharacters = getCharacters
    //    }
    //
    //    func fetch() {
    //        getCharacters.invoke(page: 1)
    //        .receive(on: DispatchQueue.main)
    //        .sink(receiveCompletion: { [weak self] value in
    //            guard let self = self else { return }
    //            switch value {
    //            case .failure:
    //                self.dataSource = []
    //            case .finished:
    //                break
    //            }
    //        }) { [weak self] characters in
    //            guard let self = self else { return }
    //            self.dataSource = characters!
    //        }.store(in: &disposables)
    //    }
    
    //private let getCharacters: GetCharacters = GetCharacters()
    @Injected private var getCharacters: GetCharacters
    
    @Injected
    private var updateFavorite: UpdateFavorite
    
    @Published var charactersList : [CharacterDto] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    private var cancelables = [AnyCancellable]()
    private var page = 1
    private var totalPages = 0
    @Published var hasMorePages = false
    
    init() {
        
    }
    
    func loadPage() {
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
    
    func updateFavor(dto: CharacterDto) {
        updateFavorite.invoke(dto: dto)
    }
}
