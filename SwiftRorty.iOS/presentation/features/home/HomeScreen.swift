//
//  HomeScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    init() {
        let appeareance = UITabBarAppearance()
        appeareance.backgroundColor = UIColor(Color.Primary)
        
        // Use this appearance when scrolling behind the TabView:
        UITabBar.appearance().standardAppearance = appeareance
        // Use this appearance when scrolled all the way up:
        UITabBar.appearance().scrollEdgeAppearance = appeareance
        
        //UITabBar.appearance().backgroundColor = UIColor(Color.Primary)
        UITabBar.appearance().barTintColor = UIColor(Color.Primary)
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.UnSelectedBottomItem)
        //UITabBar.appearance().isTranslucent = false
        
    }
    
    var body: some View {
        TabView {
            CharactersScreen().tabItem {
                Label(LocalizedStringKey("bottom_menu_characters"), systemImage: "magazine").fontStyle(RortyFont.body5)
            }
            FavoritesScreen()
                .tabItem {
                Label(LocalizedStringKey("bottom_menu_favorites"), systemImage: "heart").fontStyle(RortyFont.body5)
            }
            SettingsScreen().tabItem {
                Label(LocalizedStringKey("bottom_menu_settings"), systemImage: "gearshape").fontStyle(RortyFont.body5)
            }
        }
        .accentColor(Color.SelectedBottomItem)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
