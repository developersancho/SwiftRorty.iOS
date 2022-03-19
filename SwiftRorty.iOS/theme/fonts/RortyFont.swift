//
//  AppFontTemplate.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 28.02.2022.
//

import Foundation
import SwiftUI

struct RortyFont {
    static let title = FontStyle(font: Font.custom(FontType.bold.rawValue, size: 22.0),
                                    weight: .bold,
                                    foregroundColor: Color.Text)
    
    static let heading = FontStyle(font: Font.custom(FontType.semi_bold.rawValue, size: 18.0),
                                      weight: .medium,
                                      foregroundColor: Color.Text)
    
    static let heading2 = FontStyle(font: Font.custom(FontType.semi_bold.rawValue, size: 16.0),
                                      weight: .semibold,
                                      foregroundColor: Color.ToggleRed)
    
    static let body = FontStyle(font: Font.custom(FontType.medium.rawValue, size: 14.0),
                                   weight: .regular,
                                   foregroundColor: .Text)
    
    static let body2 = FontStyle(font: Font.custom(FontType.medium.rawValue, size: 14.0),
                                   weight: .medium,
                                   foregroundColor: .Text)
    
    static let body3 = FontStyle(font: Font.custom(FontType.bold.rawValue, size: 15.0),
                                   weight: .bold,
                                   foregroundColor: .Text)
    
    static let body4 = FontStyle(font: Font.custom(FontType.bold.rawValue, size: 14.0),
                                   weight: .bold,
                                   foregroundColor: .Text)
    
    static let body5 = FontStyle(font: Font.custom(FontType.bold.rawValue, size: 12.0),
                                   weight: .medium,
                                   foregroundColor: .Text)
    
    static let body6 = FontStyle(font: Font.custom(FontType.regular.rawValue, size: 14.0),
                                   weight: .regular,
                                   foregroundColor: .Text)
}
