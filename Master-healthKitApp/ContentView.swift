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
                    Image(systemName: "gear")
                    Text("情報")
                }
                .tag(2)
        }
        .navigationBarTitle(Text("タイトル"), displayMode: .inline)
        .padding()
    }
}

struct FirstView: View {
    var body: some View {
        Text("ホーム画面")
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

