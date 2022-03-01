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
            ZStack {
                Color.Background.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    LazyVStack {
                        
                        ForEach(viewModel.charactersList, id: \.id) { character in
                            NavigationLink(
                                destination: DetailScreen(id: character.id ?? 1),
                                label: {
                                    CharacterRow(dto: character) { favorState in
                                        print(favorState)
                                        //viewModel
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
                        Text("Characters").fontTemplate(AppFontTemplate.title)
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
