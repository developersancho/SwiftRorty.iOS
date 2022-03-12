//
//  SettingsScreen.swift
//  SwiftRorty.iOS
//
//  Created by developersancho on 31.01.2022.
//

import SwiftUI

struct SettingsScreen: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    fileprivate func SettingsContentView() -> some View {
        return ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.Card).shadow(radius: 1)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .center) {
                    Text(LocalizedStringKey("text_theme_mode"))
                        .fontTemplate(AppFontTemplate.body4)
                    Spacer()
                    Toggle("", isOn: $isDarkMode)
                        .toggleStyle(ColoredToggleStyle())
                        //.toggleStyle(SwitchToggleStyle(tint: .ToggleRed))
                        .onChange(of: isDarkMode, perform: { value in
                            Log.debug("isDarkMode => \(isDarkMode)")
                        })
                }
                Divider()
                HStack(alignment: .center) {
                    Text(LocalizedStringKey("text_app_version"))
                        .fontTemplate(AppFontTemplate.body4)
                    Spacer()
                    Text("\(UIApplication.appVersion())")
                        .fontTemplate(AppFontTemplate.body2)
                }
                
            }.padding(12)
            
        }.padding(12)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                //Color.Background.edgesIgnoringSafeArea(.bottom)
                Color.Background.ignoresSafeArea()
                LazyVStack(alignment: .leading) {
                    ScrollView {
                        SettingsContentView()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(LocalizedStringKey("toolbar_settings_title")).fontTemplate(AppFontTemplate.title)
                    }
                }
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
