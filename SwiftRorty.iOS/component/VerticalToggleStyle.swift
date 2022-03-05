//
//  VerticalToggleStyle.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 5.03.2022.
//

import SwiftUI

struct VerticalToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack(alignment: .leading) {
            Toggle(configuration).labelsHidden()
        }
        .frame(width: .infinity)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(configuration.isOn ? Color.green: Color.gray, lineWidth: 2) // <4>
        )
    }
}
