//
//  testView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/04/28.
//

import SwiftUI

struct testView: View {
    let medlinePlusAPIKey = "YOUR_MEDLINEPLUS_API_KEY"
    let openFDAAPIKey = "YOUR_OPENFDA_API_KEY"
    
    var body: some View {
        VStack {
            Button(action: {
                getMedlinePlusInformation(topic: "menstruation and food")
            }) {
                Text("Get MedlinePlus Information - Menstruation and Food")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                getMedlinePlusInformation(topic: "menstruation and exercise")
            }) {
                Text("Get MedlinePlus Information - Menstruation and Exercise")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                getOpenFDAInformation(topic: "sanitary items")
            }) {
                Text("Get OpenFDA Information - Sanitary Items")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    
    func getMedlinePlusInformation(topic: String) {
        guard let url = URL(string: "https://api.nlm.nih.gov/medlineplus/v3/search?max=5&api_key=\(medlinePlusAPIKey)&q=\(topic)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(MedlinePlusResponse.self, from: data) {
                    // Handle the decoded response here
                    print(decodedResponse)
                } else {
                    print("Unable to decode response")
                }
            }
        }.resume()
    }
    
    func getOpenFDAInformation(topic: String) {
        guard let url = URL(string: "https://api.fda.gov/drug/label.json?api_key=\(openFDAAPIKey)&search=\(topic)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(OpenFDAResponse.self, from: data) {
                    // Handle the decoded response here
                    print(decodedResponse)
                } else {
                    print("Unable to decode response")
                }
            }
        }.resume()
    }
}

struct MedlinePlusResponse: Codable {
    // Define the structure of the MedlinePlus API response here
}

struct OpenFDAResponse: Codable {
    // Define the structure of the OpenFDA API response here
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
