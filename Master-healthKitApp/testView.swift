//
//  testView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/04/28.
//

import SwiftUI

struct testView: View {
    var body: some View {
            NavigationView {
                ZStack(alignment: .top) {
                    Rectangle().foregroundColor(.white) // 1
                    ScrollView {
                        Text("view")
                    }.offset(y: 1) // 2
                }
                .navigationTitle("Title")
                .navigationBarTitleDisplayMode(.large)
            }
        }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
