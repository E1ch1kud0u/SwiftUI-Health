//
//  SettingView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/04/21.
//

import SwiftUI

extension Color {
    static let lightBackgroundColor = Color(red: 0.96, green: 0.96, blue: 0.96)
    static let darkBackgroundColor = Color(red: 0.1, green: 0.1, blue: 0.1)
}


struct SettingsView: View {
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
                
                Section(header: Text("Color Theme")) {
                    List {
                        Button(action: {
                            UserDefaults.standard.set(0, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Light")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 0 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(1, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Dark")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 1 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(2, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Red")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 2 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(3, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Green")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 3 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(4, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Blue")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 4 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(5, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Purple")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 5 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.purple)
                                }
                            }
                        }
                        
                        Button(action: {
                            UserDefaults.standard.set(6, forKey: "colorTheme")
                        }) {
                            HStack {
                                Text("Pink")
                                Spacer()
                                if UserDefaults.standard.integer(forKey: "colorTheme") == 6 {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.pink)
                                }
                            }
                        }
                    }
                    
                    HStack {
                        Text("Preview")
                        Spacer()
                        switch UserDefaults.standard.integer(forKey: "colorTheme") {
                            case 0:
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                            case 1:
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 50, height: 50)
                            case 2:
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 50, height: 50)
                            case 3:
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 50, height: 50)
                            case 4:
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 50, height: 50)
                            case 5:
                                Circle()
                                    .fill(Color.purple)
                                    .frame(width: 50, height: 50)
                            case 6:
                                Circle()
                                    .fill(Color.pink)
                                    .frame(width: 50, height: 50)
                            default:
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 50, height: 50)
                        }
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
