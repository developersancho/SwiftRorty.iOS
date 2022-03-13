//
//  FavoritesScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct FavoritesScreen: View {
    @ObservedObject
    private var viewModel = FavoritesViewModel()
    
    @State
    var bottomSheetShown: Bool = false
    
    @State
    var selectedDto: CharacterDto = CharacterDto.defaultDto()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.favorites, id: \.id) { character in
                        NavigationLink(
                            destination: DetailScreen(id: character.id),
                            label: {
                                FavoriteRow(dto: character, callback: {
                                    self.bottomSheetShown.toggle()
                                    self.selectedDto = character
                                })
                            })
                            
                    }
                    
                }
                .padding(10)
                .emptyState(viewModel.favorites.isEmpty) {
                    LazyVStack {
                        LottieView(name: "empty", loopMode: .loop)
                            .frame(width: 250, height: 250)
                            .padding(.init(top: 20, leading: 0, bottom: 10, trailing: 0))
                        Spacer()
                        Text(LocalizedStringKey("text_no_data_found")).fontTemplate(AppFontTemplate.heading)
                    }
                }
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(LocalizedStringKey("toolbar_favorites_title")).fontTemplate(AppFontTemplate.title)
                    }
                }
            }.onAppear(perform: {
                viewModel.loadFavorites()
            })
        }
        .bottomSheet(
            isPresented: $bottomSheetShown,
            height: 290,
            topBarHeight: 10,
            contentBackgroundColor: Color.Primary,
            topBarBackgroundColor: Color.Primary,
            showTopIndicator: false,
            content: {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(LocalizedStringKey("text_favor_delete"))
                                .fontTemplate(AppFontTemplate.heading2)
                            Text("\(selectedDto.name ?? "Loading...")")
                                .fontTemplate(AppFontTemplate.body2)
                        }
                        Spacer()
                        Button ( action: { self.bottomSheetShown.toggle() }) {
                            Label {
                                Text(LocalizedStringKey("text_cancel"))
                                    .foregroundColor(Color.Text)
                            } icon: {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(Color.ToggleRed)
                            }
                        }
                        
                    }.padding()
                    
                    Text("text_delete_favor_description \(selectedDto.name ?? "...")")
                        .padding()
                        .fixedSize(horizontal: false, vertical: true)
                        .fontTemplate(AppFontTemplate.body6)
                    
                    Button(LocalizedStringKey("text_approve_remove"), action: {
                        self.bottomSheetShown.toggle()
                        viewModel.deleteFavoriteItem(id: selectedDto.id)
                    }).padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.white)
                        .background(Color.ToggleRed)
                    
                    Spacer()
                }.padding()
            })
    }
    
    var sectionList : some View {
        List {
            ForEach(viewModel.favorites, id: \.id) { character in
                NavigationLink(
                    destination: DetailScreen(id: character.id),
                    label: {
                        FavoriteRow(dto: character, callback: {
                            
                        })
                    }).swipeActions(edge: .trailing, content: {
                        Button (action: {  }) {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.ToggleRed)
                    })
                    .listRowInsets(.init(top: 0, leading: 8, bottom: 8, trailing: 8))
                    .listRowBackground(Color.Card)
                    .listRowSeparator(.visible, edges: .bottom)
                    .listRowSeparatorTint(.Background)
            }.onDelete(perform: {_ in })
        }
        .listStyle(.plain)
        .padding(.all, 8)
        .background(Color.Background)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(LocalizedStringKey("toolbar_favorites_title")).fontTemplate(AppFontTemplate.title)
                }
            }
        }.onAppear(perform: {
            viewModel.loadFavorites()
        })
    }
    
    func delete(at source: IndexSet) {
        
    }
}

struct FavoritesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesScreen().colorScheme(.dark)
            .background(Color.Background)
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 mini"))
    }
}
