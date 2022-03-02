//
//  SettingsScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct SettingsScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.Background.edgesIgnoringSafeArea(.all)
                Text("Settings Screen, Version: \(UIApplication.appVersion())")
                    .fontTemplate(AppFontTemplate.title)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text("Settings").fontTemplate(AppFontTemplate.title)
                    }
                }
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
