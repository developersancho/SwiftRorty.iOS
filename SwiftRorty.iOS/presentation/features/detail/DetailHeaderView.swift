//
//  DetailHeaderView.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 3.03.2022.
//

import Foundation
import SwiftUI

struct DetailHeaderView: View {
    var dto: CharacterDto?
    
    var body: some View {
        if let image = dto?.image,
           let url = URL(string: image) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
        } else {
            RoundedRectangle(cornerRadius: 16)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                .frame(width: 200, height: 200)
                .foregroundColor(.gray)
        }
    }
}

struct DetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderView()
    }
}
