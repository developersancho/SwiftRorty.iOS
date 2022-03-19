//
//  DetailStatusView.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.03.2022.
//

import SwiftUI

struct DetailStatusView: View {
    var dto: CharacterDto?
    
    var body: some View {
        LazyHStack(alignment: .top, spacing: 10) {
            if dto?.status == Status.alive {
                Circle()
                    .size(width: 12, height: 12)
                    .fill(Color.green)
            } else if dto?.status == Status.dead {
                Circle()
                    .size(width: 12, height: 12)
                    .fill(Color.red)
            } else {
                Circle()
                    .size(width: 12, height: 12)
                    .fill(Color.gray)
            }
            
            Text("\(dto?.status?.rawValue ?? "")")
                .fontStyle(RortyFont.body3)
                .redacted(reason: dto?.status?.rawValue == nil ? .placeholder : [])
        }.frame(
            maxWidth: .infinity,
            maxHeight: 40,
            alignment: .center
        )
    }
}

struct DetailStatusView_Previews: PreviewProvider {
    static var previews: some View {
        DetailStatusView()
    }
}
