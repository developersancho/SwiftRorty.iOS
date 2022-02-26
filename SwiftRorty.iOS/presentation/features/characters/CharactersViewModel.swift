//
//  CharactersViewModel.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import Foundation
import UIKit
import Combine

class CharactersViewModel: ObservableObject {
    private let getCharacters: GetCharacters
    private var disposables = Set<AnyCancellable>()
    
    @Published var dataSource: [CharacterDto]
    
    init(_ getCharacters: GetCharacters = GetCharacters()){
        self.dataSource = []
        self.getCharacters = getCharacters
    }
    
    func fetch() {
        getCharacters.invoke(page: 1)
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { [weak self] value in
            guard let self = self else { return }
            switch value {
            case .failure:
                self.dataSource = []
            case .finished:
                break
            }
        }) { [weak self] characters in
            guard let self = self else { return }
            self.dataSource = characters!
        }.store(in: &disposables)
    }
}
