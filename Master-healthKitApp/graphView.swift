import SwiftUI
import HealthKit
import SwiftUICharts

struct graphView: View {
    let healthStore = HKHealthStore()
    let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount)!
    let heartRate = HKObjectType.quantityType(forIdentifier: .heartRate)!
  //  let bPressure = HKObjectType.quantityType(forIdentifier: .bloodPressure)!
    
    @State private var steps: Double = 0.0
    @State private var hRate: Double = 0.0
//    @State private var bloodP: Double = 0.0
    @State private var stepHistory: [Double] = []
    @State private var heartRateHistory: [Double] = []
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                VStack { // Use HStack instead of VStack
                    if let maxStep = stepHistory.max(), let minStep = stepHistory.min() {
                        VStack {
                            LineChartView(data: stepHistory, title: "Steps", legend: "Steps", form: ChartForm.medium)
                                .frame(width: geo.size.width / 2, height: 200) // Set a fixed width for the chart view
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    Spacer().frame(height: 50)
                    if let maxHR = heartRateHistory.max(), let minHR = heartRateHistory.min() {
                        VStack {
                            LineChartView(data: heartRateHistory, title: "Heart Rate", legend: "BPM", form: ChartForm.medium)
                                .frame(width: geo.size.width / 2, height: 200,  alignment: .center) // Set a fixed width for the chart view
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color.white)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .animation(.easeInOut)
        .onAppear{
            authorizeStepCount()
            authorizeHeartRate()
        }// Apply animation to the container view
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }

    
     func authorizeStepCount() {
        let healthTypesToRead: Set<HKObjectType> = [stepCount]
        healthStore.requestAuthorization(toShare: nil, read: healthTypesToRead) { (success, error) in
            if success {
                print("Step count authorization granted")
                getTodayStepCount()
            } else {
                if let error = error {
                    print("Step count authorization failed: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func authorizeHeartRate() {
        let healthTypesToRead: Set<HKObjectType> = [heartRate]
        healthStore.requestAuthorization(toShare: nil, read: healthTypesToRead) { (success, error) in
            if success {
                print("Heart rate authorization granted")
                getTodayHRavg()
            } else {
                if let error = error {
                    print("Heart rate authorization failed: \(error.localizedDescription)")
                }
            }
        }
    }
    

    
    private func getTodayStepCount() {
        let calendar = Calendar.current
        let now = Date()
        let startDate = calendar.startOfDay(for: now)
        let endDate = now

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepCount, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                if let error = error {
                    print("Failed to fetch steps: \(error.localizedDescription)")
                }
                return
            }

            DispatchQueue.main.async {
                self.steps = sum.doubleValue(for: HKUnit.count())
                self.stepHistory.append(self.steps) // Safely add to the history array
            }
        }

        healthStore.execute(query)
    }
    private func getTodayHRavg() {
        let calendar = Calendar.current
        let now = Date()
        let startDate = calendar.startOfDay(for: now)
        let endDate = now

        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: heartRate, quantitySamplePredicate: predicate, options: .discreteAverage) { (query, result, error) in
            if let error = error {
                print("Failed to fetch heart rate: \(error.localizedDescription)")
                return
            }
            
            guard let result = result, let average = result.averageQuantity() else {
                print("No heart rate data available.")
                return
            }
            
            print("Fetched heart rate data: \(average)")

            DispatchQueue.main.async {
                self.hRate = average.doubleValue(for: HKUnit(from: "count/min"))
                self.heartRateHistory.append(self.hRate) // Safely add to the history array
            }
        }

        healthStore.execute(query)
    }

}

//
