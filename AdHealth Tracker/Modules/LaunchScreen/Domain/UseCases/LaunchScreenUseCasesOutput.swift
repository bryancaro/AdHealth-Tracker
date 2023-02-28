//
//  LaunchScreenUseCasesOutput.swift
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

protocol LaunchScreenUseCasesOutputProtocol: AnyObject {
    func onAppearSuccess()
    func onDisappearSuccess()
    func requestHealthKitAuthorizationSuccess()
    func requestHealthKitAuthorizationFailed(_ errorString: String)
    func fetchDailyStepCountSuccess(steps: Double)
    func fetchDailyStepCountFailed(_ errorString: String)
}
