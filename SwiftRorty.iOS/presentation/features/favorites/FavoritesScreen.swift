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
            ZStack{
                Color.Background.edgesIgnoringSafeArea(.all)
                HStack {
                    Text("Favorites Screen")
                        .fontTemplate(AppFontTemplate.title)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Favorites").fontTemplate(AppFontTemplate.title)
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
