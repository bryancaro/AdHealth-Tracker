//
//  LaunchScreenUseCases.swift
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

protocol LaunchScreenUseCasesProtocol: AnyObject {
    var delegate: LaunchScreenUseCasesOutputProtocol? { get set }
    
    func onAppear()
    func onDisappear()
    func requestHealthKitAuthorization()
    func fetchDailyStepCount()
}
