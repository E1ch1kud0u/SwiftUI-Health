//
//  RootView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/08/18.
//

import SwiftUI

struct RootView: View {
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    var body: some View {
        ContentView()
            .sheet(isPresented: $isFirstLaunch) {
                WorkThroughView()
            }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
