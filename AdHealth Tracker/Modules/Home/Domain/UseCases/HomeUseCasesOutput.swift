//
//  HomeUseCasesOutput.swift
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

protocol HomeUseCasesOutputProtocol: AnyObject {
    func onAppearSuccess()
    func onDisappearSuccess()
    func getHealthGoalsSuccess(data: HealthGoalsModel)
    func getHealthGoalsFailed(error: Error)
    func updateHealthGoalsSuccess(goals: [GoalModel])
    func updateHealthGoalsFailed(_ errorString: String)
}
