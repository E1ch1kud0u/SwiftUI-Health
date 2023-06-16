//
//  SettingView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/04/21.
//

import SwiftUI



struct SettingsView: View {
    @State private var selectedThemeIndex = UserDefaults.standard.integer(forKey: "colorTheme")

    var body: some View {
        NavigationView {
            
                Form {
                    Section(header: Text("General")) {
                        Toggle(isOn: .constant(true)) {
                            Text("Notifications")
                        }

                        Toggle(isOn: .constant(true)) {
                            Text("Location Services")
                        }
                    }
                }
            .navigationBarTitle("Settings")
        }
        
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
