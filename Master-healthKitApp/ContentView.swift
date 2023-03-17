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
                    Text("ホーム")
                }
                .tag(0)
            graphView()
                .tabItem {
                    Image(systemName: "person")
                    Text("グラフ")
                }
                .tag(1)
            InfoView()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("情報")
                }
                .tag(2)
        }
        .navigationBarTitle(Text("タイトル"), displayMode: .inline)
        .padding()
    }
    
}

struct FirstView: View {
    let texts = ["Hello, world!", "How are you today?", "What's up?", "Nice to meet you!"]
    let fonts: [Font]

    @State private var currentTextIndex = 0
    @State private var currentFontIndex = 0
    init() {
        // テキストファイルからフォント名のリストを読み込む
        if let url = Bundle.main.url(forResource: "Fonts", withExtension: "txt"),
            let fontNames = try? String(contentsOf: url).split(separator: "\n") {
            // フォント名のリストから`Font`オブジェクトの配列を生成する
            fonts = fontNames.map { Font.custom(String($0), size: 24) }
        } else {
            // ファイルが見つからなかった場合は、デフォルトのフォントを使用する
            fonts = [.largeTitle, .title, .headline, .subheadline, .body]
        }
    }

    var body: some View {
        VStack {
            Spacer()
            
            Text(texts[currentTextIndex])
                .font(fonts[currentFontIndex])
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

            Spacer()

            Button("Change") {
                currentTextIndex = (currentTextIndex + 1) % texts.count
                currentFontIndex = Int.random(in: 0..<fonts.count)
            }
            .padding()
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

