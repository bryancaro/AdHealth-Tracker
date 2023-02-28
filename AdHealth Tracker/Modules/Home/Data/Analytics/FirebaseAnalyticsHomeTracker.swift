//
//  FirebaseAnalyticsHomeTracker.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 26/2/23.
//  
//

import Foundation

final class FirebaseAnalyticsHomeTracker: HomeUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [FirebaseAnalyticsHomeTracker] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [FirebaseAnalyticsHomeTracker] [onDisappear]")
    }
    
    func getHealthGoalsSuccess(data: HealthGoalsModel) {
        // SEND ANALYTICS MANAGER
    }
    
    func getHealthGoalsFailed(error: Error) {
        // SEND ANALYTICS MANAGER
    }
    
    func updateHealthGoalsSuccess(goals: [GoalModel]) {
        
    }
    
    func updateHealthGoalsFailed(_ errorString: String) {
        
    }
}
