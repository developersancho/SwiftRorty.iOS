//
//  FontTemplateModifier.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 28.02.2022.
//

import Foundation
import SwiftUI

struct FontTemplateModifier: ViewModifier {
    let template: FontTemplate
    
    init(template: FontTemplate) {
        self.template = template
    }
    
    func body(content: Content) -> some View {
        content
            .font(template.font
                    .weight(template.weight)
                    .italic(template.italic))
            .lineSpacing(template.lineSpacing)
            .foregroundColor(template.foregroundColor)
    }
}

extension Font {
    public func italic(_ value: Bool) -> Font {
        return value ? self.italic() : self
    }
}

extension View {
    public func fontTemplate(_ template: FontTemplate) -> some View {
        modifier(FontTemplateModifier(template: template))
    }
}
