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

//struct FirstView: View {
//    @State var randomLine: String = ""
//    @State var randomFont: String = ""
//    @State var randomImageName: String = ""
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        VStack {
//            Spacer()
//            Image(randomImageName)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 200, height: 200) // 画像のサイズを適宜調整
//                .padding()
//            
//            Text(randomLine)
//                .font(Font.custom(randomFont, size: 24))
//                .padding()
//            
//            
//            Spacer()
//        }
//        .onAppear {
//            // ランダムな行とフォントを設定するロジックは省略
//            
//            // ダークモード切り替え時にランダムな行とフォントを再設定する
//            updateRandomLineAndFont()
//        }
//    }
//    private func updateRandomLineAndFont() {
//        
//        let famousNames = [
//                "William Shakespeare", "Walt Disney", "Audrey Hepburn", "Socrates",
//                "Bob Marley", "Charlie Chaplin", "Winston Churchill",
//                "Michael Jordan", "Mark Twain", "Ichiro Suzuki", "Abraham Lincoln",
//                "Johann Wolfgang Von Goethe", "Albert Einstein", "Jesse Jackson", "Theodore Roosevelt",
//                "Thomas Alva Edison", "Plato", "Steve Jobs",
//                "Mahatma Gandhi", "Osamu Tezuka", "Bruce Lee",
//                "Pablo Picaso", "Martin Luther King Junior",
//                "Ludwig van Beethoven", "Marilyn Monroe"
//            ]
//        // ランダムに名前を選択し、空文字列でないことを確認
//           if let randomName = famousNames.randomElement(), !randomName.isEmpty {
//               self.randomImageName = randomName
//           } else {
//               print("Valid image name not found")
//           }
//        
//        
//        if let quoteFilePath = Bundle.main.path(forResource: "Quote", ofType: "txt") {
//            do {
//                let quoteContents = try String(contentsOfFile: quoteFilePath)
//                let quoteLines = quoteContents.components(separatedBy: .newlines)
//                self.randomLine = quoteLines.randomElement() ?? ""
//            } catch {
//                print("Error loading contents of quote file")
//            }
//        } else {
//            print("Quote file not found")
//        }
//
//        if let filepath = Bundle.main.path(forResource: "font", ofType: "txt") {
//            do {
//                let contents = try String(contentsOfFile: filepath)
//                let fonts = contents.components(separatedBy: .newlines)
//                self.randomFont = fonts.randomElement() ?? ""
//            } catch {
//                print("Error loading contents of file")
//            }
//        } else {
//            print("File not found")
//        }
//
//       
//    }
//
//}

struct FirstView {
    @State private var randomNumber = Int.random(in: 1...25)
    @State private var RN = 0
    @State private var StringN = ""
    
    let filePath = Bundle.main.path(forResource: "Quote", ofType: "txt")
    let fileContent: String
    
    var body: some View {
        VStack{
            Spacer()
            Image(StringN).resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200) // 画像のサイズを適宜調整
                            .padding()
            Text(fileContent).padding()
        }
    }
    .onAppear {
        RN = randomNumber - 1
        StringN = String(randomNumber)
        init() {
            if let filePath = filePath {
                do {
                    let content = try String(contentsOfFile: filePath)
                    let lines = content.components(separatedBy: .newlines)
                    if lines.count >= randomNumber {
                        fileContent = lines[RN] // n行目を取得します。配列のインデックスは0から始まるので、n-1を指定します。
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
}

//プレビューを記載
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


