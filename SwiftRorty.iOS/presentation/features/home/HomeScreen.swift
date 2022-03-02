//
//  HomeScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    //    init () {
    //        let coloredAppearance = UINavigationBarAppearance()
    //
    //        // this overrides everything you have set up earlier.
    //        coloredAppearance.configureWithTransparentBackground()
    //        coloredAppearance.backgroundColor = UIColor(Color.Primary)
    //
    //        // to make everything work normally
    //        UINavigationBar.appearance().standardAppearance = coloredAppearance
    //        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    //    }
    
    @State var uiTabarController: UITabBarController?

    var body: some View {
        TabView {
            CharactersScreen().tabItem {
                Label("Characters", systemImage: "magazine")
            }
            FavoritesScreen().tabItem {
                Label("Favorites", systemImage: "heart")
            }
            SettingsScreen().tabItem {
                Label("Settings", systemImage: "gearshape")
            }
        }
        .onAppear() {
            UITabBar.appearance().barTintColor = UIColor(Color.Primary)
            UITabBar.appearance().unselectedItemTintColor = UIColor(Color.UnSelectedBottomItem)
        }
        .accentColor(Color.SelectedBottomItem)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
