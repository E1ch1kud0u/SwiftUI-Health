//
//  ContentView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            FirstView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            graphView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Graph")
                }
                .tag(1)
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("NEWS")
                }
                .tag(2)
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                    
                
            }
        }
        .navigationBarTitle(Text("タイトル"), displayMode: .inline)
        .padding()
    }
    
}

struct FirstView: View {
    @State var randomLine: String = ""
    @State var randomFont: String = ""
    @State var randomImageName: String = ""
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Spacer()
            Image(randomImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200) // 画像のサイズを適宜調整
                .padding()
            
            Text(randomLine)
                .font(Font.custom(randomFont, size: 24))
                .padding()
            
            
            Spacer()
        }
        .onAppear {
            // ランダムな行とフォントを設定するロジックは省略

            // ダークモード切り替え時にランダムな行とフォントを再設定する
            updateRandomLineAndFont()
        }
    }

    private func updateRandomLineAndFont() {
//        if let filepath = Bundle.main.path(forResource: "Quote", ofType: "txt") {
//            do {
//                let contents = try String(contentsOfFile: filepath)
//                let lines = contents.components(separatedBy: .newlines)
//                self.randomLine = lines.randomElement() ?? ""
//            } catch {
//                print("Error loading contents of file")
//            }
//        } else {
//            print("File not found")
//        }
        if let quoteFilePath = Bundle.main.path(forResource: "Quote", ofType: "txt") {
            do {
                let quoteContents = try String(contentsOfFile: quoteFilePath)
                let quoteLines = quoteContents.components(separatedBy: .newlines)
                self.randomLine = quoteLines.randomElement() ?? ""
            } catch {
                print("Error loading contents of quote file")
            }
        } else {
            print("Quote file not found")
        }

        if let filepath = Bundle.main.path(forResource: "font", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                let fonts = contents.components(separatedBy: .newlines)
                self.randomFont = fonts.randomElement() ?? ""
            } catch {
                print("Error loading contents of file")
            }
        } else {
            print("File not found")
        }
        
//        if let filepath = Bundle.main.path(forResource: "text", ofType: "txt") {
//            do {
//                let contents = try String(contentsOfFile: filepath)
//                let imageNames = contents.components(separatedBy: .newlines)
//                self.randomImageName = imageNames.randomElement() ?? ""
//            } catch {
//                print("Error loading contents of file")
//            }
//        } else {
//            print("File not found")
//        }
        if let imagesFilePath = Bundle.main.path(forResource: "image", ofType: "txt") {
            do {
                let imagesContents = try String(contentsOfFile: imagesFilePath)
                let imageNames = imagesContents.components(separatedBy: .newlines)
                // 同じインデックスの有名人の名前を取得
                if let index = imageNames.firstIndex(of: randomLine) {
                    self.randomImageName = imageNames[index]
                }
            } catch {
                print("Error loading contents of image file")
            }
        } else {
            print("Image file not found")
        }
    }
}
