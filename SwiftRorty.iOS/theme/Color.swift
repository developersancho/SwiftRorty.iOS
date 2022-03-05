//
//  Color.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 28.02.2022.
//

import Foundation
import SwiftUI

extension Color {
    static let Primary = Color(Color.Key.primary.rawValue)
    static let Secondary = Color(Color.Key.secondary.rawValue)
    static let Background = Color(Color.Key.background.rawValue)
    static let Error = Color(Color.Key.error.rawValue)
    
    static let SelectedBottomItem = Color(Color.Key.selectedBottomItem.rawValue)
    static let UnSelectedBottomItem = Color(Color.Key.unSelectedBottomItem.rawValue)
    
    static let Card = Color(Color.Key.card.rawValue)
    static let Text = Color(Color.Key.text.rawValue)
    static let ToggleRed = Color(Color.Key.toggleRed.rawValue)
    static let BackgroundDark = Color(Color.Key.backgroundDark.rawValue)
    static let BackgroundLight = Color(Color.Key.backgroundLight.rawValue)
    
    enum Key: String {
        case primary = "Primary"
        case secondary = "Secondary"
        case background = "Background"
        case error = "Error"
        case selectedBottomItem = "SelectedBottomItemColor"
        case unSelectedBottomItem = "UnselectedBottomItemColor"
        case card = "Card"
        case text = "Text"
        case toggleRed = "ToggleRed"
        case backgroundDark = "BackgroundDark"
        case backgroundLight = "BackgroundLight"
    }
}
