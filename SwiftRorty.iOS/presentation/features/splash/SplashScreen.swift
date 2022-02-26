//
//  SplashScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive:Bool = false
    
    var body: some View {
        if self.isActive {
            CharactersScreen()
        } else {
            VStack(alignment: HorizontalAlignment.center, spacing: 20) {
                Image(uiImage: UIImage(named: "ic_splash.jpeg")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 200)
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(Color("blue_primary"))
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            })
        }
    }
}

#if DEBUG
struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
#endif
