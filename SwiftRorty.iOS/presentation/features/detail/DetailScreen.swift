//
//  DetailScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct DetailScreen: View {
    @State var characterId: Int = 0
    
    init(id: Int) {
        _characterId = State(initialValue: id)
    }
    
    var body: some View {
        Text("Detail Screen Character Id is => \(characterId)")
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(id: 1)
    }
}
