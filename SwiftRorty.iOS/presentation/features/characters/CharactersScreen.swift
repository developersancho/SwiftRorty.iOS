//
//  CharactersPage.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import SwiftUI

struct CharactersScreen: View {
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    
                    ForEach (viewModel.charactersList) { character in
                        CharacterRow(item: character)
                    }.listStyle(.grouped)
                
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .onAppear {
                            viewModel.loadNextPage()
                        }.disabled(!viewModel.hasMorePages)
                    
                }.navigationTitle("Rick and Morty")
            }
        }
    }
    
//    var emptySection: some View {
//        Section {
//            Text("No results")
//        }
//    }
//
//    var charactersSection: some View {
//        ForEach(viewModel.dataSource) { characterDto in
//            CharacterRow(item: characterDto)
//        }
//    }
    
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
