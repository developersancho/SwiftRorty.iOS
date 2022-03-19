//
//  FavoriteRow.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 6.03.2022.
//

import SwiftUI

struct FavoriteRow: View {
    var dto: CharacterDto
    
    var callback: (() -> Void)
    
    var body: some View {
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
                    .fontStyle(RortyFont.body2)
                    .redacted(reason: dto.name == nil ? .placeholder : [])
                Text("\(dto.species ?? "")")
                    .fontStyle(RortyFont.body2)
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
                            .fontStyle(RortyFont.body3)
                            .redacted(reason: dto.status?.rawValue == nil ? .placeholder : [])
                    }.frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .leading
                    )
                }
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
            Button (action: { callback() }) {
                Label("", systemImage: "trash")
            }
            .tint(.ToggleRed)
        }
        .padding(.all, 8)
        .background(Color.Card)
        .cornerRadius(8)
        .shadow(radius: 2)
        
    }
}

struct FavoriteRow_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteRow(dto: CharacterDto.defaultDto(), callback: {
            
        })
    }
}
