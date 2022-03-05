//
//  ColoredToggleStyle.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 5.03.2022.
//

import SwiftUI

struct ColoredToggleStyle: ToggleStyle {
    var onColor = Color(UIColor.systemGray5) 
    var offColor = Color(UIColor.systemGray5)
    var thumbColor = Color.ToggleRed
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label // The text (or view) portion of the Toggle
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 29)
                .overlay(
                    Circle()
                        .fill(thumbColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
        }
        .font(.title)
        //.padding(.horizontal)
    }
}
