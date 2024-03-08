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
    @State private var randomNumber = Int.random(in: 1...25)
    @State private var RN = 0
    @State private var StringN = ""
    @State private var fileContent: String = ""
    
    let filePath = Bundle.main.path(forResource: "Quote", ofType: "txt")
    
    
    var body: some View {
        VStack {
            Spacer()
            Image(StringN).resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            Text(fileContent).padding()
            Spacer()
        }
        .onAppear {
            RN = randomNumber - 1
            StringN = String(randomNumber)
            loadFileContent()
        }
    }
    
    private func loadFileContent() {
        if let filePath = filePath {
            do {
                let content = try String(contentsOfFile: filePath)
                let lines = content.components(separatedBy: .newlines)
                if lines.count >= randomNumber {
                    fileContent = lines[RN]
                } else {
                    fileContent = "ファイルには7行目がありません。"
                }
            } catch {
                fileContent = "ファイルの読み込み中にエラーが発生しました。"
            }
        } else {
            fileContent = "ファイルが見つかりませんでした。"
        }
    }
}

//プレビューを記載
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
