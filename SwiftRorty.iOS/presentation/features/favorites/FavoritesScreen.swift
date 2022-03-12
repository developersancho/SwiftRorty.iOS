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
                }
                .padding(10)
                .emptyState(viewModel.favorites.isEmpty) {
                    LazyVStack {
                        LottieView(name: "empty", loopMode: .loop)
                            .frame(width: 250, height: 250)
                            .padding(.init(top: 20, leading: 0, bottom: 10, trailing: 0))
                        Spacer()
                        Text(LocalizedStringKey("text_no_data_found")).fontTemplate(AppFontTemplate.heading)
                    }
                }
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
