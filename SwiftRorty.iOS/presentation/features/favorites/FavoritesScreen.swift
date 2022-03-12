//
//  FavoritesScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @ObservedObject
    private var viewModel = FavoritesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.favorites, id: \.id) { character in
                        NavigationLink(
                            destination: DetailScreen(id: character.id),
                            label: {
                                FavoriteRow(dto: character)
                            })
                    }
                }.padding(10)
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(LocalizedStringKey("toolbar_favorites_title")).fontTemplate(AppFontTemplate.title)
                    }
                }
            }.onAppear(perform: {
                viewModel.loadFavorites()
            })
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
