//
//  DetailContentView.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.03.2022.
//

import SwiftUI

struct DetailContentView: View {
    var contents: [KeyValueModel] = []
    var dto: CharacterDto?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.Card).shadow(radius: 1)
            
            VStack(alignment: .leading, spacing: 12) {
                DetailStatusView(dto: dto)
                ForEach(contents, id: \.id) { content in
                    HStack(alignment: .center) {
                        Text(content.key!)
                            .fontStyle(RortyFont.body4)
                            .redacted(reason: content.key == nil ? .placeholder : [])
                        Spacer()
                        Text(content.value!)
                            .fontStyle(RortyFont.body2)
                            .redacted(reason: content.value == nil ? .placeholder : [])
                    }
                    Divider()
                }
            }
            .padding(.init(top: 16, leading: 12, bottom: 0, trailing: 12))
        }
    }
}

struct DetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        DetailContentView()
    }
}
