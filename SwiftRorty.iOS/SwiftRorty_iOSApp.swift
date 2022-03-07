//
//  SwiftRorty_iOSApp.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 30.01.2022.
//

import SwiftUI

@main
struct SwiftRorty_iOSApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreen().preferredColorScheme(isDarkMode ? .dark : .light)
                .environment(\.locale, .init(identifier: "en"))
        }
    }
}
