//
//  FavoritesScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    NavigationLink(
                        destination: DetailScreen(id: CharacterDto.defaultDto().id ?? 1),
                        label: {
                            FavoriteRow(dto: CharacterDto.defaultDto())
                        })
                    
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
            }
        }
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen()
    }
}
