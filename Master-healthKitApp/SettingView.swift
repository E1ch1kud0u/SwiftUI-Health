//
//  SettingView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/04/21.
//

import SwiftUI



struct SettingsView: View {
    var body: some View{
        NavigationView{
            VStack{
                NavigationLink(destination: TermsAndConditionsENView()) {
                    Text("Terms and conditions")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                NavigationLink(destination: TermsAndConditionsJPView()) {
                    Text("利用規約")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}



struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
