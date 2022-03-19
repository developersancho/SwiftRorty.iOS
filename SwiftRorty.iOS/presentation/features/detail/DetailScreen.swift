//
//  DetailScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct DetailScreen: View {
    @StateObject
    private var viewModel = DetailViewModel()
    @State
    private var characterId: Int = 0
    
    init(id: Int) {
        _characterId = State(initialValue: id)
    }
    
    var body: some View {
        ZStack {
            Color.Background.edgesIgnoringSafeArea(.all)
            ScrollView {
                LazyVStack {
                    DetailHeaderView(dto: viewModel.dto)
                    DetailContentView(contents: viewModel.details, dto: viewModel.dto)
                }.padding(12)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(LocalizedStringKey("toolbar_detail_title")).fontStyle(RortyFont.title)
                }
            }
        }
        .onAppear(perform: {
            viewModel.loadDetail(characterId: characterId)
        })
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(id: 1)
    }
}
