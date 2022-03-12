//
//  AppFontTemplate.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 28.02.2022.
//

import Foundation
import SwiftUI

struct AppFontTemplate {
    
    static let title = FontTemplate(font: Font.custom(AppFont.bold.rawValue, size: 22.0),
                                    weight: .bold,
                                    foregroundColor: Color.Text)
    
    static let heading = FontTemplate(font: Font.custom(AppFont.semi_bold.rawValue, size: 18.0),
                                      weight: .medium,
                                      foregroundColor: Color.Text)
    
    static let heading2 = FontTemplate(font: Font.custom(AppFont.semi_bold.rawValue, size: 16.0),
                                      weight: .semibold,
                                      foregroundColor: Color.ToggleRed)
    
    static let body = FontTemplate(font: Font.custom(AppFont.medium.rawValue, size: 14.0),
                                   weight: .regular,
                                   foregroundColor: .Text)
    
    static let body2 = FontTemplate(font: Font.custom(AppFont.medium.rawValue, size: 14.0),
                                   weight: .medium,
                                   foregroundColor: .Text)
    
    static let body3 = FontTemplate(font: Font.custom(AppFont.bold.rawValue, size: 15.0),
                                   weight: .bold,
                                   foregroundColor: .Text)
    
    static let body4 = FontTemplate(font: Font.custom(AppFont.bold.rawValue, size: 14.0),
                                   weight: .bold,
                                   foregroundColor: .Text)
    
    static let body5 = FontTemplate(font: Font.custom(AppFont.bold.rawValue, size: 12.0),
                                   weight: .medium,
                                   foregroundColor: .Text)
    
    static let body6 = FontTemplate(font: Font.custom(AppFont.regular.rawValue, size: 14.0),
                                   weight: .regular,
                                   foregroundColor: .Text)
    
    
}
