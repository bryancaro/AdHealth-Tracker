//
//  FirebaseAnalyticsLaunchScreenTracker.swift
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

final class FirebaseAnalyticsLaunchScreenTracker: LaunchScreenUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [FirebaseAnalyticsLaunchScreenTracker] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [FirebaseAnalyticsLaunchScreenTracker] [onDisappear]")
    }
    
    func requestHealthKitAuthorizationSuccess() {
        
    }
    
    func requestHealthKitAuthorizationFailed(_ errorString: String) {
        
    }
    
    func fetchDailyStepCountSuccess(steps: Double) {
        
    }
    
    func fetchDailyStepCountFailed(_ errorString: String) {
        
    }
}
