//
//  CharactersPage.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import SwiftUI

struct CharactersScreen: View {
    @ObservedObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            List {
                if viewModel.dataSource.isEmpty {
                    emptySection
                } else {
                    charactersSection
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Rick And Morty")
        }
    }
    
    var emptySection: some View {
        Section {
            Text("No results")
        }
    }
    
    var charactersSection: some View {
        ForEach(viewModel.dataSource) { characterDto in
            CharacterRow(item: characterDto)
        }
    }
    
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
