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
            Button("Authorize Data") {
//                graphView.authorizeStepCount()
//                graphView.authorizeHeartRate()
            }
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: .constant(true)) {
                        Text("Notifications")
                    }
                    Toggle(isOn: .constant(true)) {
                        Text("Location Services")
                    }
                }
                
//                Button("Privacy Policy") {
//                                    // ボタンがタップされたとき、WebViewを表示
//                                    isShowingWebView.toggle()
//                                }
//                                .sheet(isPresented: $isShowingWebView) {
//                                    // WebViewを表示する
//                                    WebViewContainer(urlString: "https://example.com/privacy-policy") // ここにプライバシーポリシーのURLを指定
//                                }
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
