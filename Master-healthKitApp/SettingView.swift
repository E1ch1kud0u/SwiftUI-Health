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


//struct SettingsView: View {
//    @State private var colorTheme = UserDefaults.standard.integer(forKey: "colorTheme")
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("General")) {
//                    Toggle(isOn: .constant(true)) {
//                        Text("Notifications")
//                    }
//
//                    Toggle(isOn: .constant(true)) {
//                        Text("Location Services")
//                    }
//                }
//
//                Section(header: Text("Color Theme")) {
//                    List {
//                        ForEach(0..<7) { index in
//                            Button(action: {
//                                colorTheme = index
//                                UserDefaults.standard.set(colorTheme, forKey: "colorTheme")
//                            }) {
//                                HStack {
//                                    Text(colorName(for: index))
//                                    Spacer()
//                                    if colorTheme == index {
//                                        Image(systemName: "checkmark")
//                                            .foregroundColor(.blue)
//                                    }
//                                }
//                            }
//                        }
//                    }
//
//                    HStack {
//                        Text("Preview")
//                        Spacer()
//                        Circle()
//                            .fill(selectedColor())
//                            .frame(width: 50, height: 50)
//                    }
//                }
//            }
//            .navigationBarTitle("Settings")
//        }
//    }
//
//    private func colorName(for index: Int) -> String {
//        switch index {
//        case 0:
//            return "Light"
//        case 1:
//            return "Dark"
//        case 2:
//            return "Red"
//        case 3:
//            return "Green"
//        case 4:
//            return "Blue"
//        case 5:
//            return "Purple"
//        case 6:
//            return "Pink"
//        default:
//            return "Light"
//        }
//    }
//
//    private func selectedColor() -> Color {
//        switch colorTheme {
//        case 0:
//            return .white
//        case 1:
//            return .black
//        case 2:
//            return .red
//        case 3:
//            return .green
//        case 4:
//            return .blue
//        case 5:
//            return .purple
//        case 6:
//            return .pink
//        default:
//            return .white
//        }
//    }
//}

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

                    Section(header: Text("Color Theme")) {
                        List {
                            ForEach(themes.indices) { index in
                                Button(action: {
                                    selectedThemeIndex = index
                                    UserDefaults.standard.set(selectedThemeIndex, forKey: "colorTheme")
                                }) {
                                    HStack {
                                        Text(themes[index].name)
                                        Spacer()
                                        if selectedThemeIndex == index {
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.blue)
                                        }
                                    }
                                }
                            }
                        }

                        HStack {
                            Text("Preview")
                            Spacer()
                            Circle()
                                .fill(themes[selectedThemeIndex].color)
                                .frame(width: 50, height: 50)
                        }
                    }
                }
            .navigationBarTitle("Settings")
        }
    }
}

struct Theme {
    let name: String
    let color: Color
}

let themes = [
    Theme(name: "Light", color: .white),
    Theme(name: "Dark", color: .black),
    Theme(name: "Red", color: .red),
    Theme(name: "Green", color: .green),
    Theme(name: "Blue", color: .blue),
    Theme(name: "Purple", color: .purple),
    Theme(name: "Pink", color: .pink)
]

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
