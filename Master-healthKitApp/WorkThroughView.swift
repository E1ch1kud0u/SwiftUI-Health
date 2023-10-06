//
//  WorkThroughView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/08/18.
//

import SwiftUI

struct WorkThroughView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text("About "+"")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                Spacer()
                    .frame(height: 50)
                AnnounceView()
            }
            
            Spacer()
            
            DoneButton()
        }
        .padding(EdgeInsets(top: 100, leading: 30, bottom: 50, trailing: 35))
    }
}

struct WorkThroughView_Previews: PreviewProvider {
    var isLaunch = true
    static var previews: some View {
        Group {
            WorkThroughView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            WorkThroughView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}

struct CellView: View {
    let image: Image
    let headline: String
    let discription: String
    
    var body: some View {
        HStack(spacing: 20) {
            image
                .font(.largeTitle)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing: 5) {
                Text(headline)
                    .font(.headline)
                    .foregroundColor(.black)
                    .bold()
                Text(discription)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CellView(image: Image(systemName: "message.fill"),
                     headline: "XXXXXXXXXXXXXXX",
                     discription: "YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}

struct AnnounceView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            CellView(image: Image(systemName: "chart.line.uptrend.xyaxis"),
                     headline: "Graph",
                     discription: "It keeps your heart rate, and the number of steps you took in a day.")
            CellView(image: Image(systemName: "info.circle.fill"), headline: "Information", discription: "Gives you information about food, goods, and exersise during mensturation.")
            
        }
    }
}

struct AnnounceView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            AnnounceView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}

struct DoneButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Continue")
                .bold()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding([.top, .bottom], 15)
        .background(Color.blue)
        .cornerRadius(10)
    }
}

struct DoneButton_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            DoneButton()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
}
//
