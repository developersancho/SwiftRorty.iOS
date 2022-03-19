//
//  CharactersPage.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import SwiftUI

struct CharactersScreen: View {
    @ObservedObject
    var viewModel = CharactersViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.Background.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        
                        ForEach(viewModel.charactersList, id: \.id) { character in
                            NavigationLink(
                                destination: DetailScreen(id: character.id),
                                label: {
                                    CharacterRow(dto: character) { favorState in
                                        Log.debug("\(favorState)")
                                        viewModel.updateFavor(dto: character, state: favorState)
                                    }
                                })
                        }
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .onAppear {
                                viewModel.loadNextPage()
                            }.disabled(!viewModel.hasMorePages)
                        
                    }.padding(.all, 8)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(LocalizedStringKey("toolbar_characters_title")).fontStyle(RortyFont.title)
                    }
                }
            }.onAppear(perform: {
                viewModel.loadPage()
            })
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
