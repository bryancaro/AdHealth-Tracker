//
//  LaunchScreenHealthKit.swift
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

protocol LaunchScreenHealthKitProtocol {
    func requestHealthKitAuthorization(completion: @escaping(HealthKitError?) -> Void)
}

final class LaunchScreenHealthKit: Health, LaunchScreenHealthKit.ServerCalls {
    typealias ServerCalls = LaunchScreenHealthKitProtocol
    
    func requestHealthKitAuthorization(completion: @escaping(HealthKitError?) -> Void) {
        manager.requestAuthorization(completion: completion)
    }
    
    func fetchDailyStepCount(completion: @escaping(Double, HealthKitError?) -> Void) {
        manager.fetchDailyStepCount(for: Date(), completion: completion)
    }
}
