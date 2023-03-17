//
//  graphView.swift
//  Master-healthKitApp
//
//  Created by Airi Furukawa on 2023/03/10.
//

import SwiftUI
import Charts
import HealthKit


struct graphView: View {
    let healthStore = HKHealthStore()
    let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount)!
    
    @State private var steps: Double = 0.0 // 取得した歩数を保存する変数
    
    var body: some View {
        VStack {
            if steps == 0.0 { // 歩数が取得されていない場合には「Authorize」ボタンを表示する
                Text("Tap the button to authorize HealthKit access")
                Button("Authorize") {
                    healthStore.requestAuthorization(toShare: nil, read: [stepCount]) { (success, error) in
                        if let error = error {
                            print("Failed to request authorization = \(error)")
                            return
                        }
                        if success {
                            print("Authorization granted")
                            getTodayStepCount() // 認証が成功したら今日の歩数を取得する
                        }
                    }
                }
            } else { // 取得された歩数を表示する
                Text("Steps: \(Int(steps))")
                    .padding()
                
                
            }
            AreaMarkView()
        }
    }
    
    // 今日の歩数を取得する
    private func getTodayStepCount() {
        let calendar = Calendar.current
        let now = Date()
        let startDate = calendar.startOfDay(for: now)
        let endDate = now
        
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let query = HKSampleQuery(sampleType: stepCount, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { (query, samples, error) in
            if let error = error {
                print("Failed to fetch steps = \(error)")
                return
            }
            
            guard let samples = samples as? [HKQuantitySample] else { return }
            
            DispatchQueue.main.async {
                steps = samples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.count()) } // 歩数を合計し、@State変数に保存する
            }
        }
        
        healthStore.execute(query)
    }
}


struct graphView_Previews: PreviewProvider {
    static var previews: some View {
        graphView()
    }
}


struct AreaMarkView: View {
    var body: some View {
        Chart(sampleData) { data in
            AreaMark(
                x: .value("Name", data.name),
                y: .value("Amount", data.amount)
            )
            .foregroundStyle(by: .value("From", data.from))
            .position(by: .value("From", data.from))
        }
        .chartForegroundStyleScale([
            "PlaceA": .green.opacity(0.4), "PlaceB": .purple.opacity(0.4)
        ])
        .frame(height: 300)
        .padding()
    }
}




struct SampleData: Identifiable {
    var id: String { name }
    let name: String
    let amount: Double
    let from: String
}
let sampleData: [SampleData] = [
    .init(name: "NameA", amount: 2500, from: "PlaceA"),
    .init(name: "NameB", amount: 3500, from: "PlaceA"),
    .init(name: "NameC", amount: 2000, from: "PlaceA"),
    .init(name: "NameD", amount: 4500, from: "PlaceA"),
    .init(name: "NameE", amount: 5000,from: "PlaceA"),
    .init(name: "NameF", amount: 5500,from: "PlaceA"),
    .init(name: "NameA", amount: 360, from: "PlaceB"),
    .init(name: "NameB", amount: 640, from: "PlaceB"),
    .init(name: "NameC", amount: 680, from: "PlaceB"),
    .init(name: "NameD", amount: 760, from: "PlaceB"),
    .init(name: "NameE", amount: 780, from: "PlaceB"),
    .init(name: "NameF", amount: 800, from: "PlaceB")
]
