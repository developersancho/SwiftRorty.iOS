//
//  CharacterRow.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 26.02.2022.
//

import SwiftUI
import Foundation

struct CharacterRow: View {
    var item: CharacterDto
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(item.name ?? "")")
            Text("\(item.status?.rawValue ?? "")")
        }
    }
}
