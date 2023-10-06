//
//  GraphView2.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/08/04.
//

import SwiftUI

struct GraphView2: View {
    let steps: Double
    let heartRate: Double
        
    var body: some View {
        VStack {
            Text("Steps: \(Int(steps))")
                .padding()
                .font(.title)
            Text("Heart Rate: \(Int(heartRate))")
                .padding()
                .font(.title)
            // Add your graph implementation here
        }
    }
}

struct GraphView2_Previews: PreviewProvider {
    static var previews: some View {
        GraphView2()
    }
}
