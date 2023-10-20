//
//  TermsAndConditionsJPView.swift
//  Master-healthKitApp
//
//  Created by 古川愛莉 on 2023/10/13.
//

import SwiftUI

struct TermsAndConditionsJPView: View {
    let termsAndConditionsText: String

    init() {
        if let fileURL = Bundle.main.url(forResource: "TACjp", withExtension: "txt") {
            do {
                termsAndConditionsText = try String(contentsOf: fileURL)
            } catch {
                termsAndConditionsText = "Failed to load Terms and Conditions."
            }
        } else {
            termsAndConditionsText = "Terms and Conditions file not found."
        }
    }
    var body: some View {
        ScrollView {
            Text(termsAndConditionsText)
                .padding()
        }
        .navigationBarTitle("利用規約", displayMode: .inline)
    }
}


