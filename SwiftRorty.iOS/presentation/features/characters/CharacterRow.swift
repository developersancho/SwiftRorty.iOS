//
//  CharacterRow.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 26.02.2022.
//

import SwiftUI
import Foundation

struct CharacterRow: View {
    //@Binding
    var dto: CharacterDto
    var callback: ((_ favorState: Bool) -> Void)?
    
    @State var favor: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.Card).shadow(radius: 2)
            
            HStack {
                if let image = dto.image,
                   let url = URL(string: image) {
                    AsyncImage(url: url) { image in
                        image.resizable()
                    } placeholder: {
                        Color.gray
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 80, height: 80)
                        .foregroundColor(.gray)
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(dto.name ?? "Loading...")")
                        .fontTemplate(AppFontTemplate.body2)
                        .redacted(reason: dto.name == nil ? .placeholder : [])
                    Text("\(dto.species ?? "")")
                        .fontTemplate(AppFontTemplate.body2)
                        .redacted(reason: dto.species == nil ? .placeholder : [])
                    HStack {
                        LazyHStack {
                            if dto.status == Status.alive {
                                Circle()
                                    .size(width: 12, height: 12)
                                    .fill(Color.green)
                            } else if dto.status == Status.dead {
                                Circle()
                                    .size(width: 12, height: 12)
                                    .fill(Color.red)
                            } else {
                                Circle()
                                    .size(width: 12, height: 12)
                                    .fill(Color.gray)
                            }
                            
                            Text("\(dto.status?.rawValue ?? "")")
                                .fontTemplate(AppFontTemplate.body3)
                                .redacted(reason: dto.status?.rawValue == nil ? .placeholder : [])
                        }.frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .leading
                        )
                        
                        Button(action: {
                            favor = !favor
                            callback?(favor)
                            //dto.isFavorite = favor
                        }) {
                            if dto.isFavorite {
                                Image(systemName: "heart.fill").foregroundColor(Color.red)
                            } else {
                                Image(systemName: "heart.fill").foregroundColor(Color.gray)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
            }
            .padding(10)
        }
        
    }
}
