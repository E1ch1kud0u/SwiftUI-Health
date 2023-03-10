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
            }
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
