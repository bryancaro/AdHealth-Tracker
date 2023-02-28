//
//  HealthKitManager.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 27/2/23.
//  
//

import Foundation
import HealthKit

class Health: HealthKitProtocol {
    var manager: HealthKitController = HealthKitController()
}

class HealthKitController: HealthKitControllerProtocol {
    static let shared = HealthKitController()
    
    private let healthStore = HKHealthStore()
    private let stepCountType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    private let stepCountUnit = HKUnit.count()
    
    // Request authorization to access step count data
    func requestAuthorization(completion: @escaping(HealthKitError?) -> Void) {
        let typesToShare: Set<HKSampleType> = []
        let typesToRead: Set<HKObjectType> = [stepCountType]
        
        healthStore.requestAuthorization(toShare: typesToShare, read: typesToRead) { (success, error) in
            if let error {
                print("🩺🔴 [HEALTHKIT] [REQUEST][ERROR]: [\(error.localizedDescription)]")
                completion(.healthDataUnauthorized)
                return
            }
            
            guard success else {
                completion(.healthDataUnauthorized)
                return
            }
            
            completion(nil)
        }
    }
    
    func readStatusRequest() {
        let authorizationStatus = self.healthStore.authorizationStatus(for: self.stepCountType)

        switch authorizationStatus {
        case .notDetermined:
            print("🩺🟢 [HEALTHKIT]: [REQUEST notDetermined]")
        case .sharingDenied:
            print("🩺🟢 [HEALTHKIT]: [REQUEST sharingDenied]")
        case .sharingAuthorized:
            print("🩺🟢 [HEALTHKIT]: [REQUEST sharingAuthorized]")
        @unknown default:
            print("🩺🟢 [HEALTHKIT]: [REQUEST default]")
        }
    }
    
    func fetchDailyStepCount(for date: Date, completion: @escaping(Double, HealthKitError?) -> Void) {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: date)
        let endDate = calendar.date(byAdding: .day, value: 1, to: startDate)?.addingTimeInterval(-1)
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepCountType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (query, statistics, error) in
            guard let statistics = statistics, let sum = statistics.sumQuantity() else {
                print("🩺🔴 [HEALTHKIT] [REQUEST][ERROR]: [\(HealthKitError.queryFailed)]")
                completion(0, .queryFailed)
                return
            }
            
            print("🩺🔵 [HEALTHKIT]: [DAILYSTEPS SUCCESS]")
            let count = sum.doubleValue(for: self.stepCountUnit)
            completion(count, nil)
        }
        
        healthStore.execute(query)
    }
    
    
    func saveStepCount(date: Date, stepCount: Double, completion: @escaping(HealthKitError?) -> Void) {
        let quantity = HKQuantity(unit: stepCountUnit, doubleValue: stepCount)
        let sample = HKQuantitySample(type: stepCountType, quantity: quantity, start: date, end: date)
        healthStore.save(sample) { (success, error) in
            if let error {
                print("🩺🔴 [HEALTHKIT] [REQUEST][ERROR]: [\(error.localizedDescription)]")
                completion(.healthDataUnauthorized)
                return
            }
            
            print("🩺🔵 [HEALTHKIT]: [SAVESTEP SUCCESS]")
            completion(nil)
        }
    }
}

