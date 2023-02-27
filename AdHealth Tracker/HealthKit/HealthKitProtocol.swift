//
//  HealthKitProtocol.swift
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

protocol HealthKitProtocol {
    var manager: HealthKitController { get }
}

protocol HealthKitControllerProtocol: AnyObject {
    func requestAuthorization(completion: @escaping(HealthKitError?) -> Void)
    func fetchDailyStepCount(for date: Date, completion: @escaping(Double, HealthKitError?) -> Void)
    func saveStepCount(date: Date, stepCount: Double, completion: @escaping(HealthKitError?) -> Void)
}

enum HealthKitError: Error {
    case healthDataNotAvailable
    case healthDataUnauthorized
    case queryFailed
    case saveFailed
    
    var localizedDescription: String {
        switch self {
        case .healthDataNotAvailable:
            return "Health data is not available on this device."
        case .healthDataUnauthorized:
            return "This app is not authorized to access health data."
        case .queryFailed:
            return "Query to fetch health data failed."
        case .saveFailed:
            return "Save operation to health data store failed."
        }
    }
}
